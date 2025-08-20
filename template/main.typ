
#import "@local/flindeeered:0.1.0": *

#show: flindeeered.with(
  // Paper title
  title: "Title",

  // An object for each author. See the commented lines for possible fields, but typically Flinders requires only {name: F Lastname} and {topic: ENGR0000 Topic Name}
  authors: (
    (
      name: "F McLastname",
      // department: "Science and Engineering",
      // organisation: "Flinders University",
      // email: "firstname.mclastname@flinders.edu.au",
      topic: "ENGR0000 Topic Name",
    ),
  ),

  // Write the abstract in this content box. Delete the lorem if you want too.
  abstract: [#lorem(20)],

  // A list of strings for each index term
  index-terms: ("Foo", "Bar"),

  // Pass in a Typst bibliography function here, a default has been provided with some suggested settings
  bibliography: bibliography("references.bib", style: "ieee", full: true),

  // The {Firstname McLastname (mcla0123)} parameters that need to appear in the header.
  // Both or either of them can be omitted and it will format appropriately
  studentName: "Firstname McLastname",
  studentFAN: "mcla1234",
  // If for some reason the first {I. Introduction} heading needs to be omitted, set {ommitIntro: true}
  // Note that this will remove the dropcap. If this is still needed, use the droplet package and see the docs/template file for implementation
  omitIntro: false,
)
// Start writing the body underneath.

#lorem(20) \ \

// Demo code -----------------------------------------------------------------
$ sum I_"in" = sum I_"out" $ <intro.kcl>

#figure(
  caption: [The Planets of the Solar System and Their Average Distance from the Sun],
  table(
    columns: (6em, auto),
    align: (left, right),
    table.header[Planet][Distance (million km)],
    [Mercury], [57.9],
    [Venus], [108.2],
    [Earth], [149.6],
    [Mars], [227.9],
    [Jupiter], [778.6],
    [Saturn], [1,433.5],
    [Uranus], [2,872.5],
    [Neptune], [4,495.1],
  ),
) <tab:planets>

#lorem(20) The sentence was then ended by referring to @tab:planets.

// Place this where convinient and position at the bottom left-hand corner of the first page




// End demo code -----------------------------------------------------------------

