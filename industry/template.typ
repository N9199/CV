// ============================================================
// Rendering helpers. This file only knows how to draw entries
// from data.typ, given a `track` (e.g. "eda", "general"). It has
// no opinion about which track is active — that's set per
// entry-point file (main-eda.typ, main-general.typ, ...).
// ============================================================

#let highlight = black

#let page-setup(body) = {
  set page(margin: 0.5in)
  set text(size: 10.5pt)
  set par(justify: false, leading: 0.55em)
  body
}

#let name(n) = align(center)[
  #text(size: 22pt, weight: "bold", fill: highlight)[#n]
  #v(-0.2em)
]

#let topinfo(body) = align(center)[#body]

// Renders name / tagline / location / contact lines for the given
// track, from the `header` dict in data.typ.
#let render-header(header, track) = {
  name(header.at("name", default: ""))
  topinfo[#text(size: 13pt)[#header.at(track).tagline]]
  topinfo[#header.at("location", default: "")]
  for line in header.at("contact", default: ()) {
    topinfo[#line]
  }
}

#let resumesection(title) = [
  #v(0.45em)
  #text(size: 13pt, weight: "bold", fill: highlight)[#title]
  #v(-0.65em)
  #line(length: 100%, stroke: 0.6pt)
  #v(-0.4em)
]

// Resolve one bullet for `track`. Returns `none` if the bullet is
// excluded on this track (via an explicit "tracks" allow-list).
#let resolve-bullet(b, track) = {
  if type(b) != dictionary {
    // plain string or content -> shown as-is on every track
    b
  } else {
    let tracks = b.at("tracks", default: none)
    if tracks != none and track not in tracks {
      none
    } else {
      b.at(track, default: b.at("text", default: none))
    }
  }
}

#let render-bullets(bullets, track) = {
  for b in bullets {
    let t = resolve-bullet(b, track)
    if t != none [
      - #t
    ]
  }
}

// Shared by Experience and Teaching & Research: a company/role
// header line, optional bullets, optional labeled sublist (e.g. "Courses").
#let render-job(entry, track) = {
  [=== *#entry.company* #h(1fr) *#entry.location* \
  _#(entry.role)_ #h(1fr) #entry.dates]
  render-bullets(entry.at("bullets", default: ()), track)
  let extra = entry.at("extra", default: none)
  if extra != none {
    [_#(extra.label):_]
    for item in extra.items [
      - #item
    ]
  }
}

#let render-jobs(entries, track) = {
  for e in entries {
    render-job(e, track)
  }
}

#let render-project(p, track) = {
  [=== *#link(p.url, p.title)*]
  render-bullets(p.bullets, track)
  v(0.3em)
}

#let render-projects(ps, track) = {
  for p in ps {
    render-project(p, track)
  }
}

#let render-education-entry(e) = [
  === *#e.institution* #h(1fr) *#e.location* \
  _#(e.degree)_ #h(1fr) #e.dates \
  *Coursework:* #e.coursework.join(", ") \
  *Activities:* #e.activities.join(", ")
]

#let render-education(entries) = {
  for e in entries {
    render-education-entry(e)
  }
}

#let render-skills(lines, track) = {
  for s in lines {
    let value = resolve-bullet(s.value, track)
    if value != none [
      *#(s.label):* #value \
    ]
  }
}

#let render-awards(entries) = {
  for a in entries {
    [#link(a.url)[#a.name] #a.note #h(1fr) #a.year \ ]
  }
}
