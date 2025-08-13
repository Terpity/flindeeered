
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
  abstract: [These instructions give you guidelines for preparing Report Journals for EMGR2702 and ENGR8802 Electrical Circuits and Machines/GE version. Use this document as a template if you are using Microsoft Word 6.0 or later. Report titles should be written in uppercase and lowercase letters, not all uppercase. Avoid writing long formulas with subscripts in the title; short formulas that identify the elements are fine (e.g., "Nd–Fe–B"). Do not write “(Invited)” in the title. Full names of students are preferred in the student field, but are not required. Put a space between students’ initials. Define all symbols used in the abstract. Do not cite references in the abstract. Do not delete the blank line immediately above the abstract; it sets the footnote at the bottom of this column. Abstract ideally should contain following: #[ #set text(red)
  what is a report journal about, what are the methods used and what is/are expected outcome/outcomes.]],

  // A list of strings for each index term
  index-terms: ("Enter key words or phrases in alphabetical order, separated by commas.",),

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

THIS document is a template for Typst versions 0.13 or later. In the introduction provide the most relevant information related to the context of the report journal content including report structure. \ \

= Guidelines For Manuscript Preparation

== Abbreviations and Acronyms
Define abbreviations and acronyms the first time they are used in the text, even after they have already been defined in the abstract. Abbreviations such as ac and dc do not have to be defined. Abbreviations that incorporate periods should not have spaces: write “C.N.R.S.,” not “C. N. R. S.” Do not use abbreviations in the title unless they are unavoidable.
== Other Recommendations
Use one space after periods and colons. Hyphenate complex modifiers: “zero-field-cooled magnetization.” Avoid dangling participles, such as, “Using (1), the potential was calculated.” [It is not clear who or what used (1).] Write instead, “The potential was calculated by using (1),” or “Using (1), we calculated the potential.”
Use a zero before decimal points: “0.25,” not “.25.” Use “$"cm"^3$,” not “cc.” Indicate sample dimensions as “$0.1 "cm" times 0.2 "cm"$,” not “$0.1 times 0.2 "cm"^2$.” The abbreviation for “seconds” is “s,” not “sec.” Use “$"Wb/m"^2$” or “webers per square meter,” not “$"webers/m"^2$.” When expressing a range of values, write “7 to 9” or “7-9,” not “$7~9$.”
A parenthetical statement at the end of a sentence is punctuated outside of the closing parenthesis (like this). (A parenthetical sentence is punctuated within the parentheses.) In English, periods and commas are within quotation marks, like “this period.” Other punctuation is “outside”! Avoid contractions; for example, write “do not” instead of “don’t.” The serial comma is preferred: “A, B, and C” instead of “A, B and C.”
Remember to check spelling. If your native language is not English, please get a native English-speaking colleague to carefully proofread your report journal.

== How to Create Figures
Use Open Type fonts when creating your figures, if possible. A listing of the acceptable fonts are as follows: Open Type Fonts: Times Roman, Helvetica, Helvetica Narrow, Courier, Symbol, Palatino, Avant Garde, Bookman, Zapf Chancery, Zapf Dingbats, and New Century Schoolbook. 
= Math
Wrap any math with '\$'for inline math, or '\$ '[equation]' \$' for display math. Use the 'equation' markup style to number equations, and use the 'math' markup style for inline math. For example, $E = m c^2$ is inline math, while $ E = m c^2 $ is display math.
== Equations
Numbered equations are consecutive with equation numbers in parentheses flush with the right margin, as in (1). First use '\$ '. Then type your equation. Close with ' \$' Equations are automatically numbered in order of appearance. To make your equations more compact, you may use the solidus ( / ), the exp function, or appropriate exponents. Use parentheses to avoid ambiguities in denominators. Punctuate equations when they are part of a sentence, as in

Be sure that the symbols in your equation have been defined before the equation appears or immediately following. Italicize symbols (_T_ might refer to temperature, but T is the unit tesla). Refer to “(1),” not “Eq. (1)” or “equation (1),” except at the beginning of a sentence: “Equation (1) is ....”
= Units
Use either SI (MKS) or CGS as primary units. (SI units are strongly encouraged.). This applies to papers in data storage. For example, write “$15" Gb/cm"^2$ ($100 "Gb/in"^2$).” Avoid combining SI and CGS units, such as current in amperes and magnetic field in oersteds. This often leads to confusion because equations do not balance dimensionally. If you must use mixed units, clearly state the units for each quantity in an equation.
The SI unit for magnetic field strength H is A/m. However, if you wish to use units of T, either refer to magnetic flux density B or magnetic field strength symbolized as $µ_0H$. Use the center dot to separate compound units, e.g., “$"A" dot "m"^2$.”

= Some Common Mistakes
The word “data” is plural, not singular. The subscript for the permeability of vacuum µ0 is zero, not a lowercase letter “o.” The term for residual magnetization is “remanence”; the adjective is “remanent”; do not write “remnance” or “remnant.” Use the word “micrometer” instead of “micron.” A graph within a graph is an “inset,” not an “insert.” The word “alternatively” is preferred to the word “alternately” (unless you really mean something that alternates). Use the word “whereas” instead of “while” (unless you are referring to simultaneous events). Do not use the word “essentially” to mean “approximately” or “effectively.” Do not use the word “issue” as a euphemism for “problem.” When compositions are not specified, separate chemical symbols by en-dashes; for example, “NiMn” indicates the intermetallic compound $"Ni"_0.5"Mn"_0.5$ whereas “Ni–Mn” indicates an alloy of some composition $"Ni"_"x""Mn"_(1-"x")$.
Be aware of the different meanings of the homophones “affect” (usually a verb) and “effect” (usually a noun), “complement” and “compliment,” “discreet” and “discrete,” “principal” (e.g., “principal investigator”) and “principle” (e.g., “principle of measurement”). Do not confuse “imply” and “infer.”Prefixes such as “non,” “sub,” “micro,” “multi,” and “ultra” are not independent words; they should be joined to the words they modify, usually without a hyphen. There is no period after the “et” in the Latin abbreviation “_et al_.” (it is also italicized). The abbreviation “i.e.,” means “that is,” and the abbreviation “e.g.,” means “for example” (these abbreviations are not italicized).

= Guidelines For Graphics Preparation

== Types of Graphics
The following list outlines the different types of graphics used in report journals. They are categorized based on their construction, and use of color / shades of gray.
=== Color/Grayscale Figures
Figures that are meant to appear in color, or shades of black/gray. Such figures may include photographs, 
illustrations, multicolor graphs, and flowcharts.

=== Lineart Figures
Figures need to be composed of only black lines and shapes. These figures should have no shades or half-tones of gray. Only black and white.
=== Tables
Data charts which are typically black and white, but sometimes include color.
#figure(
  caption: [The Planets of the Solar System and Their Average Distance from the Sun],
  table(
    columns: (6em, auto),
    align: (left, left),
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
== Multipart Figures
Figures compiled of more than one sub-figure presented side-by-side, or stacked. If a multipart figure is made up of multiple figure types (one part is lineart, and another is grayscale or color) the figure should meet the stricter guidelines.
== File Formats For Graphics
Format and save your graphics using a suitable graphics processing program that will allow you to create the images as PostScript (PS), Encapsulated PostScript (.EPS), Tagged Image File Format (.TIFF), Portable Document Format (.PDF), or Portable Network Graphics (.PNG) sizes them, and adjusts the resolution settings. If you created your source files in one of the following programs you will be able to submit the graphics without converting to a PS, EPS, TIFF, PDF, or PNG file: Microsoft Word, Microsoft PowerPoint, or Microsoft Excel. Though it is not required, it is recommended that these files be saved in PDF format rather than DOC, XLS, or PPT. Doing so will protect your figures from common font and arrow stroke issues that occur when working on the files across multiple platforms. When submitting your final paper, your graphics should all be submitted individually in one of these formats along with the manuscript.
== Sizing of Graphics
Most charts, graphs, and tables are one column wide (3.5 inches / 88 millimeters / 21 picas) or page wide (7.16 inches / 181 millimeters / 43 picas). The maximum depth a graphic can be is 8.5 inches (216 millimeters / 54 picas). When choosing the depth of a graphic, please allow space for a caption. Figures can be sized between column and page widths if the author chooses, however it is recommended that figures are not sized less than column width unless when necessary. 
There is currently one publication with column measurements that don’t coincide with those listed above. 

== Resolution
The proper resolution of your figures will depend on the type of figure it is as defined in the “Types of Figures” section. Lineart, including tables should be a minimum of 600dpi.
== Color space
The term color space refers to the entire sum of colors that can be represented within the said medium. For our purposes, the three main color spaces are Grayscale, RGB (red/green/blue) and CMYK (cyan/magenta/yellow/black). RGB is generally used with on-screen graphics, whereas CMYK is used for printing purposes.
All color figures should be generated in RGB or CMYK color space. Grayscale images should be submitted in Grayscale color space. Line art may be provided in grayscale OR bitmap colorspace. Note that “bitmap colorspace” and “bitmap file format” are not the same thing. When bitmap color space is selected, .TIF/.TIFF is the recommended file format.

== Accepted Fonts within Figures
When preparing your graphics it is suggested that you use of one of the following Open Type fonts: Times New Roman, Helvetica, Arial, Cambria, and Symbol. If you are supplying EPS, PS, or PDF files all fonts must be embedded. Some fonts may only be native to your operating system; without the fonts embedded, parts of the graphic may be distorted or missing.
A safe option when finalizing your figures is to strip out the fonts before you save the files, creating “outline” type. This converts fonts to artwork what will appear uniformly on any screen.

== Using labels within Figures
=== Figure Axis labels
Figure axis labels are often a source of confusion. Use words rather than symbols. As an example, write the quantity “Magnetization,” or “Magnetization M,” not just “M.” Put units in parentheses. Do not label axes only with units. As in Fig. 1, for example, write “Magnetization (A/m)” or “Magnetization ($"A" dot "m"^1$),” not just “A/m.” Do not label axes with a ratio of quantities and units. For example, write “Temperature (K),” not “Temperature/K.” 
Multipliers can be especially confusing. Write “Magnetization (kA/m)” or “Magnetization ($10^3$ A/m).” Do not write “Magnetization (A/m) $times$ 1000” because the reader would not know whether the top axis label in Fig. 1 meant 16000 A/m or 0.016 A/m. Figure labels should be legible, approximately 8 to 10 point type.
=== Subfigure Labels in Multipart Figures and Tables
Multipart figures should be combined and labeled before final submission. Labels should appear centered below each subfigure in 8 point Times New Roman font in the format of (a) (b) (c). 
== Referencing a Figure or Table Within Your Report Journal
When referencing your figures and tables within your paper, use the abbreviation “Fig.” even at the beginning of a sentence. Do not abbreviate “Table.” Tables should be numbered with Roman Numerals.
= Conclusion
A conclusion section is required. Although a conclusion may review the main points of the paper, do not replicate the abstract as the conclusion. A conclusion might elaborate on the importance of the work or suggest applications and extensions. 
= References and Footnotes

== References
References need not be cited in text. When they are, number citations on the line, in square brackets inside the punctuation.  Multiple references are each numbered with separate brackets. When citing a section in a book, please give the relevant page numbers. In text, refer simply to the reference number. Do not use “Ref.” or “reference” except at the beginning of a sentence: “Reference [3] shows ... .” Please do not use automatic endnotes in Word, rather, type the reference list at the end of the report journal using the “References” style.
Reference numbers are set flush left and form a column of their own, hanging out beyond the body of the reference. The reference numbers are on the line, enclosed in square brackets. In all references, the given name of the author or editor is abbreviated to the initial only and precedes the last name. Use them all; use et al. only if names are not given. Use commas around Jr., Sr., and III in names. When referencing a patent, provide the day and the month of issue, or application. References may not include all information; please obtain and include relevant information. Do not combine references. There must be only one reference with each number. If there is a URL included with the print reference, it can be included at the end of the reference. 

== Footnotes
Number footnotes separately in superscripts (Insert | Footnote).#footnote[It is recommended that footnotes be avoided (except for the unnumbered footnote with the receipt date on the first page). Instead, try to integrate the footnote information into the text.]  Place the actual footnote at the bottom of the column in which it is cited; do not put footnotes in the reference list (endnotes). Use letters for table footnotes (see Table I). 

== Final stage using Typst 0.13
To export as a PDF, you can use the download (quick export as PDF) button in the top right corner of the editor. If you are creating the document locally, you will need to check the method for that program.
// Demo code -----------------------------------------------------------------
$ sum I_"in" = sum I_"out" $ <intro.kcl>



#lorem(20) The sentence was then ended by referring to @tab:planets.

// Place this where convinient and position at the bottom left-hand corner of the first page




// End demo code -----------------------------------------------------------------
