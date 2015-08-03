acf = [ 
    domain: 'acf'
    tags: [
        {
            tag: "test" // {{ @ }}
            arguments: [
                "var1"
                "var2"
            ]
            parse: '<?php {{ @ }}("{{ var1 }}", "{{ var2 }}"); ?>'
        }
    ]
]
