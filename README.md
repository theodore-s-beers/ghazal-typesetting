# Make a _ghazal_ look ok on the web

There's a certain way that a classical Persian poem—or a _ghazal_, at least—should be typeset. The main text goes in two justified columns, so that the hemistichs of each line are side by side. There should be a separator between the columns. And it's nice if line numbers are added (every three to five should be about right). The final line is centered, with its hemistichs stacked vertically.

That isn't too much to ask, is it? But it's rare to find this done correctly on the web. I've put together a bit of CSS that meets the basic requirements. (It's a work in progress…) A decent font should also be used; I tend to go with [Scheherazade](https://fonts.google.com/specimen/Scheherazade).

The best website that I'm aware of for reading classical Persian poetry is [Ganjoor](https://ganjoor.net/). So I wrote a little shell script, `pull-ghazal.sh`, which takes as an argument the Ganjoor URL of a _ghazal_, and returns a fresh HTML file with the text of the poem formatted a bit more nicely. In addition to the CSS, I use a few lines of JavaScript to manipulate the DOM. Both are inlined to keep things simple. Network access is needed only to fetch the font.

The dependencies of the script are [curl](https://github.com/curl/curl) (to download from Ganjoor), [pup](https://github.com/ericchiang/pup) (to parse HTML and cull the required elements), and [Pandoc](https://github.com/jgm/pandoc) (to generate a new HTML file).

Additional notes:

- Ideally, justification would be done with _kashīdah_, rather than with spaces. But I'm not sure there's any straightforward way of doing that in the browser.

- Setting the hemistich width is tricky. I found a rough way of using JavaScript to calculate the width required for the longest hemistich in a given poem, and then to update the CSS accordingly. It seems to work, but I'll keep testing it. The idea is that we want to make our hemistich blocks only as wide as necessary, so that there won't be too much empty space after justification.

- I've included an example output file, `hafez-407.html`. Apart from the filename, I haven't made any changes to what the script returned for the poem in question.
