
// A derivative of Typst's charged-ieee, formatted to match Flinders' standards
// https://github.com/typst/templates/tree/main/charged-ieee
//
// Adapted by Harrison Wren, 2025

#import "@preview/droplet:0.3.1": dropcap

#import "@preview/codly:1.2.0": *
#import "@preview/codly-languages:0.1.1": *

// This function gets your whole document as its `body` and formats
// it as an article in the style of the IEEE.
#let flindeeered(
  // The paper's title.
  title: [Paper Title],
  // An array of authors. For each author you can specify a name,
  // department, organization, location, and email. Everything but
  // but the name is optional.
  authors: (),
  // The paper's abstract. Can be omitted if you don't have one.
  abstract: none,
  // A list of index terms to display after the abstract.
  index-terms: (),
  // The article's paper size. Also affects the margins.
  paper-size: "a4",
  // The result of a call to the `bibliography` function or `none`.
  bibliography: none,
  // How figures are referred to from within the text.
  // Use "Figure" instead of "Fig." for computer-related publications.
  figure-supplement: [Fig.],
  // topicCode - Topic Name
  topicName: none,
  // The student submitting the paper
  studentName: none,
  // The same student's fan
  studentFAN: none,
  // Submission date
  submissionDate: none,
  // OmitIntro
  omitIntro: false,
  cols: 2,
  // The paper's content.
  body,
) = {
  // Set document metadata.
  set document(title: title, author: authors.map(author => author.name))
  set page(
    header: context [#if (studentName != none) { [#studentName] } #if (studentName != none and studentFAN != none) {
        [(]
      }#if (studentFAN != none) {
        studentFAN
      }#if (studentName != none and studentFAN != none) { [)] } #h(1fr) #counter(page).display(
        "1 of 1",
        both: true,
      )],
  )

  show: codly-init.with()
  codly(languages: codly-languages)

  set image(width: 80%)

  set table(
    inset: (x: 8pt, y: 4pt),
    stroke: (x, y) => if y <= 1 { (top: 0.5pt) },
    fill: (x, y) => if y > 0 and calc.rem(y, 2) == 0 { rgb("#efefef") },
  )

  // Set the body font.
  // As of 2024-08, the IEEE LaTeX template uses wider interword spacing
  // - See e.g. the definition \def\@IEEEinterspaceratioM{0.35} in IEEEtran.cls
  set text(region: "AU", font: "TeX Gyre Termes", size: 10pt, spacing: .35em)

  // Enums numbering
  set enum(numbering: "1)a)i)")

  // Tables & figures
  show figure: set block(spacing: 15.5pt)
  show figure: set place(clearance: 15.5pt)
  show figure.where(kind: table): set figure.caption(position: top, separator: [\ ])
  show figure.where(kind: table): set text(size: 8pt)
  show figure.where(kind: table): set figure(numbering: "I")
  show figure.where(kind: image): set figure(supplement: figure-supplement, numbering: "1")
  show figure.caption: set text(size: 8pt)
  show figure.caption: set align(start)
  show figure.caption.where(kind: table): set align(center)

  // Adapt supplement in caption independently from supplement used for
  // references.
  set figure.caption(separator: [. ])
  show figure: fig => {
    let prefix = (
      if fig.kind == table [TABLE] else if fig.kind == image [Fig.] else [#fig.supplement]
    )
    let numbers = numbering(fig.numbering, ..fig.counter.at(fig.location()))
    // Wrap figure captions in block to prevent the creation of paragraphs. In
    // particular, this means `par.first-line-indent` does not apply.
    // See https://github.com/typst/templates/pull/73#discussion_r2112947947.
    show figure.caption: it => block[#prefix~#numbers#it.separator#it.body]
    show figure.caption.where(kind: table): smallcaps
    fig
  }

  // Code blocks
  show raw: set text(
    font: "TeX Gyre Cursor",
    ligatures: false,
    size: 1em / 0.8,
    spacing: 100%,
  )

  // Configure the page and multi-column properties.
  set columns(gutter: 12pt)
  set page(
    columns: cols,
    paper: paper-size,
    // The margins depend on the paper size.
    margin: if paper-size == "a4" {
      (x: 41.5pt, top: 80.51pt, bottom: 89.51pt)
    } else {
      (
        x: (50pt / 216mm) * 100%,
        top: (55pt / 279mm) * 100%,
        bottom: (64pt / 279mm) * 100%,
      )
    },
  )

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

  // Configure appearance of equation references
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      // Override equation references.
      link(
        it.element.location(),
        numbering(
          it.element.numbering,
          ..counter(math.equation).at(it.element.location()),
        ),
      )
    } else {
      // Other references as usual.
      it
    }
  }

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  // Configure headings.
  set heading(numbering: "I.A.a)")
  show heading: it => {
    // Find out the final number of the heading counter.
    let levels = counter(heading).get()
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }

    set text(10pt, weight: 400)
    if it.level == 1 {
      // First-level headings are centered smallcaps.
      // We don't want to number the acknowledgment section.
      let is-ack = it.body in ([Acknowledgment], [Acknowledgement], [Acknowledgments], [Acknowledgements])
      set align(center)
      set text(if is-ack { 10pt } else { 11pt })
      show: block.with(above: 15pt, below: 13.75pt, sticky: true)
      show: smallcaps
      if it.numbering != none and not is-ack {
        numbering("I.", deepest)
        h(7pt, weak: true)
      }
      it.body
    } else if it.level == 2 {
      // Second-level headings are run-ins.
      set text(style: "italic")
      show: block.with(spacing: 10pt, sticky: true)
      if it.numbering != none {
        numbering("A.", deepest)
        h(7pt, weak: true)
      }
      it.body
    } else [
      // Third level headings are run-ins too, but different.
      #if it.level == 3 {
        numbering("a)", deepest)
        [ ]
      }
      _#(it.body):_
    ]
  }

  // Style bibliography.
  show std.bibliography: set text(8pt)
  show std.bibliography: set block(spacing: 0.5em)
  set std.bibliography(title: text(10pt)[References], style: "ieee")

  // Display the paper's title and authors at the top of the page,
  // spanning all columns (hence floating at the scope of the
  // columns' parent, which is the page).
  place(
    top,
    float: true,
    scope: "parent",
    clearance: 30pt,
    {
      {
        set align(center)
        set par(leading: 0.5em)
        set text(size: 24pt)
        block(below: 8.35mm, title)
      }

      // Display the authors list.
      set par(leading: 0.6em)
      for i in range(calc.ceil(authors.len() / 3)) {
        let end = calc.min((i + 1) * 3, authors.len())
        let is-last = authors.len() == end
        let slice = authors.slice(i * 3, end)
        grid(
          columns: slice.len() * (1fr,),
          gutter: 12pt,
          ..slice.map(author => align(
            center,
            {
              text(size: 11pt, author.name)
              if "department" in author [
                \ #emph(author.department)
              ]
              if "organisation" in author [
                \ #emph(author.organisation)
              ]
              if "location" in author [
                \ #author.location
              ]
              if "email" in author {
                if type(author.email) == str [
                  \ #link("mailto:" + author.email)
                ] else [
                  \ #author.email
                ]
              }
              if "topic" in author [
                \ #emph(author.topic)
              ]
            },
          ))
        )

        if not is-last {
          v(16pt, weak: true)
        }
      }
    },
  )

  set par(justify: true, first-line-indent: 1em, spacing: 0.5em, leading: 0.5em)

  // Display abstract and index terms.
  if abstract != none {
    set par(spacing: 0.45em, leading: 0.45em)
    set text(9pt, weight: 700, spacing: 150%)

    [_Abstract_---#h(weak: true, 0pt)#abstract]

    if index-terms != () {
      parbreak()
      [_Index Terms_---#h(weak: true, 0pt)#index-terms.join[, ]]
    }
    v(2pt)
  }

  [
    // Display the paper's contents.
    #if (not omitIntro) {
      [= Introduction]
      dropcap(
        height: 2,
        gap: 0pt,
        hanging-indent: 1em,
        overhang: 0pt,
      )[
        #body
      ]
    } else {
      body
    }
  ]
  // Display bibliography.
  bibliography
}


#let old(
  studentName: none,
  studentFAN: none,
  title: none,
  authors: none,
  abstract: none,
  index-terms: none,
  submissionDate: none,
  body,
) = {
  show: ieee.with(
    title: [#title],
    abstract: [
      #abstract
    ],
    authors: (authors),
    index-terms: (index-terms),
    bibliography: none,
    figure-supplement: [Fig.],
  )


  body

  bib
}

#let receipt(body) = {
  footnote(
    numbering: _ => [])[#body]
  counter(footnote).update(n => n - 1)
  context [#if (studentName != none) { [#studentName] } #if (studentName != none and submissionDate != none) {
        [- Submitted]
      }#if (submissionDate != none) {
        submissionDate
      }
  ]
}

#let appendix(cols: 1, body) = {
  show: page(columns: cols)[
    #body
  ]
}
