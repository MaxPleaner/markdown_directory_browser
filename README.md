This uses the `redcarpet` gem.

To build the `md` files into `html`,

the `md` files are firsted converted into `html`.

Then, that `html` is added to a `html` boilerplate

and moved to the `compiled` directory.

-----------------

How `redcarpet` works:

`Redcarpet::Render` options (not all of them):

```txt
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
txt

`Redcarpet::Markdown` options:

```txt
    
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
```