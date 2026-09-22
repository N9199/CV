// Single entry point for every edition. The active edition is read
// from a compiler input instead of being hardcoded per file:
//
//   typst compile --input track=eda     main.typ eda.pdf
//   typst compile --input track=general main.typ general.pdf
//
// Running `typst compile main.typ` with no --input defaults to "eda"
// (handy for local previews / the Typst web app).

#import "data.typ": header, experience, projects, teaching, education, skills, awards
#import "template.typ": *

#show: page-setup

#let track = sys.inputs.at("track", default: "eda")

#render-header(header, track)

#resumesection[Experience]
#render-jobs(experience, track)

#resumesection[Personal Projects]
#render-projects(projects, track)

#resumesection[Teaching and Research]
#render-jobs(teaching, track)

#resumesection[Education]
#render-education(education)

#resumesection[Skills]
#render-skills(skills, track)

#resumesection[Awards]
#render-awards(awards)
