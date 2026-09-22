// ============================================================
// CV content — the single source of truth.
//
// Every bullet/entry can optionally be tagged with the "tracks"
// (editions) it belongs to, and can carry per-track phrasing.
// template.typ knows how to resolve these; the entry-point files
// (main-*.typ) just pick a track and render.
//
// A bullet is either:
//   - a plain string          -> shown, unchanged, on every track
//   - a dictionary:
//       (
//         tracks: ("eda", "general"),  // omit = shown on every track
//         text: "default phrasing",     // fallback if no per-track override
//         eda: "eda-specific phrasing",     // optional override
//         general: "general-specific phrasing", // optional override
//       )
//
// To add a new edition (e.g. "backend", "ml"), just start tagging
// bullets/entries with it — nothing else needs to change. A bullet
// with no "tracks" key shows on any new track too, using "text".
// ============================================================

#let header = (
  name: "Nicholas Mc-Donnell",
  location: "Santiago, Chile",
  contact: (
    [#link("mailto:namcdonnell@uc.cl")[namcdonnell\@uc.cl]#h(1.4em) +56 9 62061387],
    [#link("https://github.com/N9199")[🔗 GitHub: N9199] #h(0.6em) #link("https://www.linkedin.com/in/nicholas-mc-donnell-schmidt-75b88984/")[🔗 LinkedIn]]
  ),
  eda: (
    tagline: "R&D Software Engineer -- EDA / Computational Geometry",
  ),
  general: (
    tagline: "Software Engineer -- Systems & Performance Engineering",
  ),
)

#let experience = (
  (
    company: "Synopsys",
    location: "Santiago, Chile",
    role: "Senior R&D Engineer",
    dates: "April 2023 -- August 2026",
    bullets: (
      (
        text: "Migrated a large C++ production codebase and all its dependencies to a new toolchain and language version.",
        eda: "Migrated the entire C++ MDP codebase and all its dependencies to the next QSC (Qualified System Configuration) and C++ version.",
      ),
      (
        text: "Resolved urgent production issues at multiple customer sites, working directly with field engineers.",
        eda: "Fixing urgent production issues for several Photomask sites.",
      ),
      (
        tracks: ("eda", "general"),
        text: "Contributed to implementing new geometric-primitive (Bézier curve) support for customer-facing workflows.",
        eda: "Contributed to the implementation of Bézier-curve support for customer workflows.",
      ),
      (
        text: "Designed and implemented a debugging/observability layer for the core product, letting issues be instantly captured and reproduced locally instead of requiring custom rebuilds for customers -- significantly cutting debugging and turnaround time for engineering and support.",
        eda: "Implemented a debugging layer for the whole MDP software to be able to instantly dump and reproduce geometrical issues without having to send additional modified builds to the customers. This greatly reduced the debugging and fixing time from R&D and AEs.",
      ),
      (
        text: "Significantly improved task-scheduling performance in the core processing pipeline for complex, large-scale customer workloads.",
        eda: "Significantly improved DP fracture task-scheduling performance for complex customer workloads.",
      ),
    ),
  ),
)

#let projects = (
  (
    title: "Ray Tracer — Rust",
    url: "https://github.com/N9199/ray_tracing_weekend",
    bullets: (
      [Implemented a physically based ray tracer following _Ray Tracing in One Weekend_, extending it with an experimental BVH acceleration structure and multithreaded rendering.],
      "Restructured the rendering pipeline to enable tail-call optimization and improve the architecture for future performance work.",
      "Currently exploring Rust based GPU-accelerated rendering.",
    ),
  ),
  (
    title: "Segment Tree Library — Rust",
    url: "https://github.com/N9199/seg-tree",
    bullets: (
      "Designed and implemented a generic, high-performance segment tree library supporting range queries, range updates, and lazy propagation.",
      "Designed the API for flexibility across different segment-tree use cases while maintaining efficient implementations.",
      "Currently implementing wide-tree layouts to improve cache locality and performance.",
    ),
  ),
)

#let teaching = (
  (
    company: "Millenium Institute Foundational Research on Data",
    location: "Santiago, Chile",
    role: "Software Engineer",
    dates: "September 2020 -- December 2022",
    bullets: (
      "Worked in projects about machine learning and interpretability.",
    ),
  ),
  (
    company: "Computer Science Department (PUC)",
    location: "Santiago, Chile",
    role: "Teacher Assistant",
    dates: "March 2021 -- December 2022",
    bullets: (
      "Designed homework assignments and supplementary problems emphasizing algorithmic problem solving and non-obvious applications of techniques introduced in class.",
    ),
    extra: (
      label: "Courses",
      items: ("Cryptography", "Algorithms & Data Structures", "Algorithm Design & Analysis"),
    ),
  ),
  (
    company: "Mathematics Faculty (PUC)",
    location: "Santiago, Chile",
    role: "Teacher Assistant",
    dates: "March 2018 -- December 2020",
    bullets: (
      "Led problem-solving sessions for undergraduate mathematics courses, working through exercises and guiding students through rigorous solution strategies in real time.",
    ),
    extra: (
      label: "Courses",
      items: ("Real Analysis", "Abstract Algebra", "Several Calculus Courses"),
    ),
  ),
)

#let education = (
  (
    institution: "Pontificia Universidad Católica de Chile (PUC)",
    location: "Santiago, Chile",
    degree: "Mathematics B.Sc.",
    dates: "March 2017 -- December 2020",
    coursework: ("Algorithms & Data Structures", "Algorithm Design & Analysis", "Probability & Statistics", "Linear Algebra", "Algorithms", "Abstract Algebra"),
    activities: ("Model Theory Seminar Organizer", "Mathematics Student Council", "Mathematics Statutes Commission"),
  ),
)

// Skills lines can also be track-tagged (string or dict) exactly like bullets,
// in case a future edition wants a different emphasis/ordering.
#let skills = (
  (label: "Programming Languages", value: "C++, Rust, Python, Java, SQL, Bash/Zsh"),
  (label: "Tools", value: "Linux, Git, Jujutsu, Vim, VSCode, Zed"),
  (label: "Languages", value: "Spanish (Native), English (professional/fluent)"),
)

#let awards = (
  (name: "International Collegiate Programming Contest", url: "https://icpc.global/", note: "Latin American Regional 2nd place in Chile (54th in Latin America)", year: "2019"),
  (name: "IEEEXTREME", url: "https://ieeextreme.org/", note: "15.0 26th place", year: "2021"),
  (name: "IEEEXTREME", url: "https://ieeextreme.org/", note: "16.0 23rd place", year: "2022"),
)
