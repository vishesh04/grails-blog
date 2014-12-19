<head>
    <meta name="layout" content="common"/>
</head>
<body>
<div id="content-wrap">
    <div class="row">
        <div id="main" class="nine columns">
            <section class="page">
                <h2>
                    ${raw(blogPost.title)}
                </h2>
                <p>
                    ${raw(blogPost.htmlContent)}
                </p>

                <g:set var="disqusShortname" value="${grails.util.Holders.config.disqusShortname}" />
                <g:if test="${disqusShortname}">
                    <div id="disqus_thread"></div>
                    <script type="text/javascript">
                        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                        var disqus_shortname = '${disqusShortname}'; // required: replace example with your forum shortname

                        /* * * DON'T EDIT BELOW THIS LINE * * */
                        (function() {
                            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                        })();
                    </script>
                    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                </g:if>
                
            </section>
        </div>
        <!--
        <div id="sidebar" class="three columns">
            <div class="widget widget_categories">
                <h3>Categories</h3>
                <ul>
                    <li><a href="#" title="">Google</a> (1)</li>
                    <li><a href="#" title="">Salesforce</a> (0)</li>
                </ul>
            </div>
        </div>
        -->
    </div>
</div>
</body>
