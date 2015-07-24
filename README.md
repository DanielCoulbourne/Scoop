# Scoop
A Gulp Plugin for Wordpress Templating (VERY VERY ALPHA)

In the spirit of iterative development this plugin only does one very simple thing right now:

It will replace 

```
{{fieldName}}
```

with

```php
<?php the_field('fieldname'); ?>
```

###Roadmap

1. Support for common Wordpress tags ( the_title, the_content, the_excerpt )
2. Support for thumbnails e.g. - 
```
{{thumbnail}} # returns <img> tag
{{thumbnail.url}} # returns image url
```
3. support for ACF Repeater and Relationship fields
4. Support for Wordpress Loop and WP_Query
5. Ability to use data from Wordpress OR JSON document with config flag (for prototyping frontent before Wordpress architecture is complete)
6. Another Gulp plugin coming soon to generate PHP for custom post types and ACF based on JSON config file above.