# Flindeeered - Flinders University Typst Template

A Typst template for academic papers formatted to match Flinders University standards, derived from Typst's [charged-ieee](https://github.com/typst/templates/tree/main/charged-ieee) template.

## Features

- IEEE-style formatting adapted for Flinders University requirements
- Automatic header generation with student name and FAN
- Abstract and index terms support
- Integrated bibliography support
- Drop cap styling for introductions
- Code highlighting with Codly
- Two-column layout by default

## Installation

### Method 1: Local Installation

1. Clone or download this repository:
   ```bash
   git clone https://github.com/Terpity/flindeeered.git
   cd flindeeered
   ```
   Or, Download as a ZIP and import the files into typst.app, copying the file structure

2. Your project structure should look like this:
   ```
   flindeeered/
   ├── main.typ              # Your main document file
   ├── template/
   │   ├── lib.typ          # Template library
   │   └── typst.toml       # Package configuration
   ├── references.bib       # Bibliography file
   ```

### Method 2: Local Package Installation

Alternatively, the package can be added to your local Typst package store:

1. **Find your local package directory:**
   - Linux/macOS: `~/.local/share/typst/packages/local/`
   - Windows: `%APPDATA%\typst\packages\local\`

2. **Create the package structure:**
   ```bash
   mkdir -p ~/.local/share/typst/packages/local/flindeeered/0.1.0
   ```

3. **Copy the template files:**
   ```bash
   cp -r template/* ~/.local/share/typst/packages/local/flindeeered/0.1.0/
   ```

4. **Use in your documents:**
   ```typst
   #import "@local/flindeeered:0.1.0": *
   ```


## Usage

### Basic Import and Setup

In your main Typst document (`main.typ`), import the template and configure it:

```typst
#import "template/lib.typ": *

#show: flindeeered.with(
  // Paper title
  title: "Your Paper Title Here",

  // Author information
  authors: (
    (
      name: "Your Name",
      topic: "ENGR1234 Your Topic Name",
    ),
  ),

  // Abstract (optional)
  abstract: [
    Your abstract goes here. This is a brief summary of your paper.
  ],

  // Index terms/keywords
  index-terms: ("Keyword1", "Keyword2", "Keyword3"),

  // Bibliography
  bibliography: bibliography("references.bib", style: "ieee", full: true),

  // Student information for header
  studentName: "Your Full Name",
  studentFAN: "your1234",
  submissionDate: "01 January 2025",

  // Optional: omit the introduction heading and drop cap
  omitIntro: false,
)

// Your document content starts here
= Introduction

Your introduction content...

= Literature Review

Your literature review...

// Continue with your sections...
```

### Configuration Options

The `flindeeered` function accepts the following parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | string | "Paper Title" | The paper's title |
| `authors` | array | `()` | Array of author objects with `name` and `topic` fields |
| `abstract` | content | `none` | Paper abstract (optional) |
| `index-terms` | array | `()` | List of keywords/index terms |
| `bibliography` | function | `none` | Result of `bibliography()` function call |
| `studentName` | string | `none` | Student's full name for header |
| `studentFAN` | string | `none` | Student's FAN for header |
| `submissionDate` | string | `none` | Submission date |
| `omitIntro` | boolean | `false` | Whether to omit the introduction heading and drop cap |
| `paper-size` | string | "a4" | Paper size |
| `cols` | integer | 2 | Number of columns |

### Author Information

Authors can include additional optional fields:

```typst
authors: (
  (
    name: "First Author",
    department: "Science and Engineering",
    organisation: "Flinders University",
    email: "first.author@flinders.edu.au",
    topic: "ENGR1234 Your Topic Name",
  ),
  // Additional authors...
),
```

### Bibliography Setup

1. Create a `references.bib` file with your references in BibTeX format
2. Import the bibliography in your template configuration:
   ```typst
   bibliography: bibliography("references.bib", style: "ieee", full: true),
   ```

### Including Figures and Tables

The template supports standard Typst figure syntax:

```typst
#figure(
  caption: [Your figure caption],
  image("path/to/your/image.png", width: 80%)
)

#figure(
  caption: [Your table caption],
  table(
    columns: (1fr, 1fr, 1fr),
    [Header 1], [Header 2], [Header 3],
    [Data 1], [Data 2], [Data 3],
  )
)
```

## File Structure Explanation

- **`main.typ`**: Your main document file where you write your content
- **`template/lib.typ`**: The template library containing all formatting functions
- **`template/typst.toml`**: Package configuration file
- **`references.bib`**: BibTeX bibliography file for citations
- **`main.pdf`**: Generated PDF output (created when you compile)

## Compiling Your Document

To compile your document to PDF:

```bash
typst compile main.typ
```

For continuous compilation (watch mode):

```bash
typst watch main.typ
```

## Dependencies

This template uses the following Typst packages:
- `@preview/droplet:0.3.1` - For drop cap styling
- `@preview/codly:1.2.0` - For code highlighting
- `@preview/codly-languages:0.1.1` - Additional language support for code highlighting

These dependencies are automatically handled by Typst when you compile your document.

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Credits

- Original template: [charged-ieee](https://github.com/typst/templates/tree/main/charged-ieee) by Typst GmbH
- Flinders University adaptation: Harrison Wren, 2025