

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    

    <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-462338-14', 'auto');
  ga('require', 'GTM-TKM62DV');
  ga('send', 'pageview', {
    
  });


  var trackOutboundLink = function(url) {
    ga('send', 'event', 'outbound', 'click', url, {
       'transport': 'beacon',
       'hitCallback': function(){document.location = url;}
    });
  }
</script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <meta property="og:title" content="brouwern/wildlifeR source: R/AOU_species_codes.R" />
    
      <meta name="description" content="R/AOU_species_codes.R defines the following functions: ">
      <meta property="og:description" content="R/AOU_species_codes.R defines the following functions: "/>
    

    <link rel="icon" href="/favicon.ico">
    
    <link rel="amphtml" href="https://rdrr.io/a/github/brouwern/wildlifeR/src/R/AOU_species_codes.R">
    <link rel="canonical" href="https://rdrr.io/github/brouwern/wildlifeR/src/R/AOU_species_codes.R" />

    <link rel="search" type="application/opensearchdescription+xml" title="R Package Documentation" href="/opensearch.xml" />

    <title>brouwern/wildlifeR source: R/AOU_species_codes.R</title>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    
  <style type="text/css">*{box-sizing:inherit}html{box-sizing:border-box}input[type=text]{-webkit-appearance:none}html{font-family:sans-serif}body{margin:0}a{background-position:0 0;background-repeat:initial initial}b,strong{font-weight:700}h1{margin:.67em 0}small{font-size:80%}img{border:0}pre{overflow:auto}code,pre{font-family:monospace,monospace;font-size:1em}button,input{color:inherit;font-family:inherit;font-size:inherit;font-style:inherit;font-variant:inherit;font-weight:inherit;line-height:inherit;margin:0}button{-webkit-appearance:button;cursor:pointer;overflow:visible;text-transform:none}input{line-height:normal}input[type=checkbox]{box-sizing:border-box;padding:0}body,html{height:100%}html{font-size:14px}body{background-color:#fff;background-position:initial initial;background-repeat:initial initial;color:rgba(0,0,0,.8705);font-family:Lato,Helvetica Neue,Arial,Helvetica,sans-serif;font-size:14px;line-height:1.4285em;margin:0;min-width:20pc;overflow-x:hidden;padding:0}h1,h3,h4{font-family:Lato,Helvetica Neue,Arial,Helvetica,sans-serif;font-weight:700;line-height:1.2857em;margin:calc(2rem - .1428em) 0 1rem;padding:0}h1{font-size:2rem;min-height:1rem}h3{font-size:1.28rem}h4{font-size:1.071rem}h3:first-child{margin-top:0}h3:last-child{margin-bottom:0}p{line-height:1.4285em;margin:0 0 1em}p:first-child{margin-top:0}a{color:#4183c4;text-decoration:none}.ui.container{display:block;max-width:100%!important}@media only screen and (max-width:767px){.ui.container{margin-left:1em!important;margin-right:1em!important;width:auto!important}}@media only screen and (max-width:991px) and (min-width:8in){.ui.container{margin-left:auto!important;margin-right:auto!important;width:723px}}@media only screen and (max-width:1199px) and (min-width:62pc){.ui.container{margin-left:auto!important;margin-right:auto!important;width:933px}}@media only screen and (min-width:75pc){.ui.container{margin-left:auto!important;margin-right:auto!important;width:1127px}}.ui.fluid.container{width:100%}.ui.header{border:0;color:rgba(0,0,0,.8705);font-family:Lato,Helvetica Neue,Arial,Helvetica,sans-serif;font-weight:700;line-height:1.2857em;margin:calc(2rem - .1428em) 0 1rem;padding:0;text-transform:none}.ui.header:first-child{margin-top:-.1428em}.ui.header .sub.header{color:rgba(0,0,0,.6);display:block;font-weight:400;line-height:1.2em;margin:0;padding:0}.ui.header .ui.label{margin-left:.5rem;vertical-align:middle}h1.ui.header{font-size:2rem}h3.ui.header{font-size:1.28rem}h4.ui.header{font-size:1.071rem}h1.ui.header .sub.header{font-size:1.1428rem}h3.ui.header .sub.header{font-size:1rem}.ui.large.header{font-size:1.714em}.ui.header .sub.header{font-size:1rem}.ui.block.header{background-color:#f3f4f5;background-position:initial initial;background-repeat:initial initial;border:1px solid #d4d4d5;border-radius:.2857rem;box-shadow:none;padding:.7857rem 1rem}.ui.header:not(h1):not(h2):not(h3):not(h4):not(h5):not(h6){font-size:1.28em}.ui.segment:first-child{margin-top:0}.ui.raised.segment{box-shadow:rgba(34,36,38,.1176) 0 2px 4px 0,rgba(34,36,38,.149) 0 2px 10px 0}.ui.breadcrumb{display:inline-block;line-height:1;margin:0;vertical-align:middle}.ui.breadcrumb:first-child{margin-top:0}.ui.breadcrumb:last-child{margin-bottom:0}.ui.breadcrumb .divider{color:rgba(0,0,0,.4);display:inline-block;font-size:.9285em;margin:0 .2142rem;opacity:.7;vertical-align:baseline}.ui.breadcrumb a{color:#4183c4}.ui.breadcrumb a.section{cursor:pointer}.ui.breadcrumb .section{display:inline-block;margin:0;padding:0}.ui.breadcrumb .active.section{font-weight:700}.ui.breadcrumb{font-size:1rem}.ui.menu{background-color:#fff;background-position:initial initial;background-repeat:initial initial;border:1px solid rgba(34,36,38,.149);border-radius:.2857rem;box-shadow:rgba(34,36,38,.149) 0 1px 2px 0;display:-webkit-box;font-family:Lato,Helvetica Neue,Arial,Helvetica,sans-serif;font-weight:400;margin:1rem 0;min-height:2.8571em}.ui.menu:after{clear:both;content:"";display:block;height:0;visibility:hidden}.ui.menu:first-child{margin-top:0}.ui.menu:last-child{margin-bottom:0}.ui.menu .menu{margin:0}.ui.menu:not(.vertical)>.menu{display:-webkit-box}.ui.menu:not(.vertical) .item{-webkit-box-align:center;display:-webkit-box}.ui.menu .item{-webkit-box-flex:0;-webkit-tap-highlight-color:transparent;-webkit-user-select:none;background-position:0 0;background-repeat:initial initial;color:rgba(0,0,0,.8705);font-weight:400;line-height:1;padding:.9285em 1.1428em;position:relative;text-decoration:none;text-transform:none;transition:background .1s ease,box-shadow .1s ease,color .1s ease;vertical-align:middle}.ui.menu>.item:first-child{border-radius:.2857rem 0 0 .2857rem}.ui.menu .item:before{background-color:rgba(34,36,38,.098);background-position:initial initial;background-repeat:initial initial;content:"";height:100%;position:absolute;right:0;top:0;width:1px}.ui.menu .item>p:first-child{margin-top:0}.ui.menu .item>i.icon{float:none;margin:0 .3571em 0 0;opacity:.9}.ui.menu .item>.input{width:100%}.ui.menu:not(.vertical) .item>.input{margin:-.5em 0;position:relative;top:0}.ui.menu .item>.input input{font-size:1em;padding-bottom:.5714em;padding-top:.5714em}.ui.menu .header.item,.ui.vertical.menu .header.item{font-weight:700;margin:0}.ui.vertical.menu .item>.header:not(.ui){font-size:1em;font-weight:700;margin:0 0 .5em}.ui.menu .dropdown.item .menu{-webkit-box-direction:normal!important;-webkit-box-orient:vertical!important;background-color:#fff;background-position:initial initial;background-repeat:initial initial;border-radius:0 0 .2857rem .2857rem;box-shadow:rgba(0,0,0,.0784) 0 1px 3px 0;left:0;margin:0;min-width:calc(100% - 1px)}.ui.menu .ui.dropdown .menu>.item{background-position:0 0!important;background-repeat:initial initial!important;box-shadow:none!important;color:rgba(0,0,0,.8705)!important;font-size:1em!important;font-weight:400!important;margin:0;padding:.7857em 1.1428em!important;text-align:left;text-transform:none!important;transition:none!important}.ui.menu .ui.dropdown.item .menu .item:not(.filtered){display:block}.ui.vertical.menu .dropdown.item>.icon{content:;float:right;margin-left:1em}.ui.vertical.menu .dropdown.item .menu{border-radius:0 .2857rem .2857rem;box-shadow:rgba(0,0,0,.0784) 0 1px 3px 0;left:100%;margin:0;min-width:0}.ui.vertical.menu .dropdown.item:not(.upward) .menu{top:0}.ui.menu .item>.label{background-color:#999;background-position:initial initial;background-repeat:initial initial;color:#fff;margin-left:1em;padding:.3em .7857em}.ui.vertical.menu .item>.label{background-color:#999;background-position:initial initial;background-repeat:initial initial;color:#fff;margin-bottom:-.15em;margin-top:-.15em;padding:.3em .7857em}.ui.menu:not(.vertical) .right.menu{display:-webkit-box;margin-left:auto!important}.ui.menu .right.menu>.item:before{left:0;right:auto}.ui.vertical.menu{-webkit-box-direction:normal;-webkit-box-orient:vertical;background-color:#fff;background-position:initial initial;background-repeat:initial initial;box-shadow:rgba(34,36,38,.149) 0 1px 2px 0;display:block}.ui.vertical.menu .item{background-position:0 0;background-repeat:initial initial;border-right-style:none;border-top-style:none;display:block}.ui.vertical.menu>.item:first-child{border-radius:.2857rem .2857rem 0 0}.ui.vertical.menu>.item:last-child{border-radius:0 0 .2857rem .2857rem}.ui.vertical.menu .item>.label{float:right;text-align:center}.ui.vertical.menu .item>i.icon{float:right;margin:0 0 0 .5em;width:1.18em}.ui.vertical.menu .item>.label+i.icon{float:none;margin:0 .5em 0 0}.ui.vertical.menu .item:before{background-color:rgba(34,36,38,.098);background-position:initial initial;background-repeat:initial initial;content:"";height:1px;left:0;position:absolute;top:0;width:100%}.ui.vertical.menu .item:first-child:before{display:none!important}.ui.vertical.menu .item>.menu{margin:.5em -1.1428em 0}.ui.vertical.menu .menu .item{background-position:0 0;background-repeat:initial initial;color:rgba(0,0,0,.498);font-size:.8571em;padding:.5em 1.3333em}.ui.vertical.menu .menu .item:before{display:none}.ui.inverted.menu{background-color:#1b1c1d;background-position:initial initial;background-repeat:initial initial;border:0 solid transparent;box-shadow:none}.ui.inverted.menu .item{background-position:0 0;background-repeat:initial initial;color:hsla(0,0%,100%,.9019)}.ui.inverted.menu .item:before{background-color:hsla(0,0%,100%,.0784);background-position:initial initial;background-repeat:initial initial}.ui.inverted.menu .header.item{background-position:0 0;background-repeat:initial initial;box-shadow:none;margin:0}.ui.menu.fixed{margin:0;position:fixed;width:100%;z-index:101}.ui.menu.fixed,.ui.menu.fixed .item:first-child,.ui.menu.fixed .item:last-child{border-radius:0}.ui.fixed.menu,.ui[class*=top\ fixed].menu{bottom:auto;left:0;right:auto;top:0}.ui[class*=top\ fixed].menu{border-left-style:none;border-right-style:none;border-top-style:none}.ui.menu{font-size:1rem}.ui.vertical.menu{width:15rem}.ui.button{-webkit-tap-highlight-color:transparent;-webkit-user-select:none;background-color:#e0e1e2;background-image:none;background-position:initial initial;background-repeat:initial initial;border:0;border-radius:.2857rem;box-shadow:transparent 0 0 0 1px inset,rgba(34,36,38,.149) 0 0 0 0 inset;color:rgba(0,0,0,.6);cursor:pointer;display:inline-block;font-family:Lato,Helvetica Neue,Arial,Helvetica,sans-serif;font-style:normal;font-weight:700;line-height:1em;margin:0 .25em 0 0;min-height:1em;outline:0;padding:.7857em 1.5em;text-align:center;text-decoration:none;text-shadow:none;text-transform:none;transition:opacity .1s ease,background-color .1s ease,color .1s ease,box-shadow .1s ease,background .1s ease;vertical-align:baseline}.ui.disabled.button{background-image:none!important;box-shadow:none!important;cursor:default;opacity:.45!important;pointer-events:none!important}.ui.facebook.button{background-color:#3b5998;background-image:none;box-shadow:rgba(34,36,38,.149) 0 0 0 0 inset;color:#fff;text-shadow:none}.ui.twitter.button{background-color:#55acee;background-image:none;box-shadow:rgba(34,36,38,.149) 0 0 0 0 inset;color:#fff;text-shadow:none}.ui.google.plus.button{background-color:#dd4b39;background-image:none;box-shadow:rgba(34,36,38,.149) 0 0 0 0 inset;color:#fff;text-shadow:none}.ui.linkedin.button{background-color:#1f88be;color:#fff;text-shadow:none}.ui.button>.icon:not(.button){height:.8571em;margin:0 .4285em 0 -.2142em;opacity:.8;transition:opacity .1s ease}.ui.button{font-size:1rem}.ui.large.button{font-size:1.1428rem}.ui.huge.button{font-size:1.4285rem}.ui.icon.button{padding:.7857em}.ui.icon.button>.icon{margin:0;opacity:.9;vertical-align:top}.ui.labeled.icon.button{padding-left:4.0714em!important;padding-right:1.5em!important;position:relative}.ui.labeled.icon.button>.icon{background-color:rgba(0,0,0,.047);border-radius:inherit 0 0 inherit;box-shadow:transparent -1px 0 0 0 inset;height:100%;left:0;line-height:1;margin:0;position:absolute;text-align:center;top:0;width:2.5714em}.ui.labeled.icon.button>.icon:after,.ui.labeled.icon.button>.icon:before{-webkit-transform:translatey(-50%);display:block;position:absolute;text-align:center;top:50%;width:100%}.ui.blue.button{background-color:#2185d0;background-image:none;box-shadow:rgba(34,36,38,.149) 0 0 0 0 inset;color:#fff;text-shadow:none}.ui.green.button{background-color:#21ba45;background-image:none;box-shadow:rgba(34,36,38,.149) 0 0 0 0 inset;color:#fff;text-shadow:none}.ui.input{color:rgba(0,0,0,.8705);display:-webkit-inline-box;font-style:normal;font-weight:400;position:relative}.ui.input input{-webkit-box-flex:1;-webkit-tap-highlight-color:transparent;background-color:#fff;background-position:initial initial;background-repeat:initial initial;border:1px solid rgba(34,36,38,.149);border-radius:.2857rem;box-shadow:none;color:rgba(0,0,0,.8705);font-family:Lato,Helvetica Neue,Arial,Helvetica,sans-serif;line-height:1.2142em;margin:0;max-width:100%;outline:0;padding:.6786em 1em;text-align:left;transition:box-shadow .1s ease,border-color .1s ease}.ui.icon.input>i.icon{border-radius:0 .2857rem .2857rem 0;cursor:default;height:100%;line-height:1;margin:0;opacity:.5;position:absolute;right:0;text-align:center;top:0;transition:opacity .3s ease;width:2.6714em}.ui.icon.input>i.icon:not(.link){pointer-events:none}.ui.icon.input input{padding-right:2.6714em!important}.ui.icon.input>i.icon:after,.ui.icon.input>i.icon:before{left:0;margin-top:-.5em;position:absolute;text-align:center;top:50%;width:100%}.ui.action.input>.button{-webkit-box-align:center;-webkit-box-flex:0;display:-webkit-box;margin:0;padding-bottom:.7857em;padding-top:.7857em}.ui.action.input:not([class*=left\ action])>input{border-bottom-right-radius:0!important;border-right-color:transparent!important;border-top-right-radius:0!important}.ui.action.input:not([class*=left\ action])>.button:not(:first-child){border-radius:0}.ui.action.input:not([class*=left\ action])>.button:last-child{border-radius:0 .2857rem .2857rem 0}.ui.input{font-size:1em}.ui.message{background-color:#f8f8f9;background-position:initial initial;background-repeat:initial initial;border-radius:.2857rem;box-shadow:rgba(34,36,38,.2196) 0 0 0 1px inset,transparent 0 0 0 0;color:rgba(0,0,0,.8705);line-height:1.4285em;margin:1em 0;min-height:1em;padding:1em 1.5em;position:relative;transition:opacity .1s ease,color .1s ease,background .1s ease,box-shadow .1s ease}.ui.message .header{display:block;font-family:Lato,Helvetica Neue,Arial,Helvetica,sans-serif;font-weight:700;margin:-.1428em 0 0}.ui.message .header:not(.ui){font-size:1.1428em}.ui.message>.icon{margin-right:.6em}.ui.message>:first-child{margin-top:0}.ui.message>:last-child{margin-bottom:0}.ui.hidden.message{display:none}.ui.icon.message{-webkit-box-align:center;display:-webkit-box;width:100%}.ui.icon.message>.icon:not(.close){-webkit-box-flex:0;display:block;font-size:3em;line-height:1;opacity:.8;vertical-align:middle;width:auto}.ui.icon.message>.content{-webkit-box-flex:1;display:block;vertical-align:middle}.ui.icon.message .icon:not(.close)+.content{padding-left:0}.ui.warning.message{background-color:#fffaf3;box-shadow:#c9ba9b 0 0 0 1px inset,transparent 0 0 0 0;color:#573a08}.ui.warning.message .header{color:#794b02}.ui.error.message{background-color:#fff6f6;box-shadow:#e0b4b4 0 0 0 1px inset,transparent 0 0 0 0;color:#9f3a38}.ui.message{font-size:1em}i.icon{-webkit-backface-visibility:hidden;-webkit-font-smoothing:antialiased;display:inline-block;font-family:Icons;font-style:normal;font-weight:400;height:1em;margin:0 .25rem 0 0;opacity:1;speak:none;text-align:center;text-decoration:inherit;width:1.18em}i.icon:before{background-position:0 0!important;background-repeat:initial initial!important}i.icon.loading{-webkit-animation:icon-loading 2s linear infinite;height:1em;line-height:1}i.green.icon{color:#21ba45!important}i.icon{font-size:1em}i.icon.search:before{content:}i.icon.lab:before{content:}i.icon.flag:before{content:}i.icon.circle:before{content:}i.icon.circle.notched:before{content:}i.icon.plus:before{content:}i.icon.caret.right:before{content:}i.icon.file.outline:before{content:}i.icon.file.text.outline:before{content:}i.icon.file:before{content:}i.icon.file.text:before{content:}i.icon.play:before{content:}i.icon.twitter:before{content:}i.icon.google.plus:before{content:}i.icon.linkedin:before{content:}i.icon.weibo:before{content:}i.icon.google:before{content:}i.icon.reddit:before{content:}i.icon.hacker.news:before{content:}i.icon.facebook:before{content:}.ui.label{background-color:#e8e8e8;background-image:none;border:0 solid transparent;border-radius:.2857rem;color:rgba(0,0,0,.6);display:inline-block;font-weight:700;line-height:1;margin:0 .1428em;padding:.5833em .833em;text-transform:none;transition:background .1s ease;vertical-align:baseline}.ui.label:first-child{margin-left:0}.ui.label:last-child{margin-right:0}a.ui.label{cursor:pointer}.ui.header>.ui.label{margin-top:-.2916em}.ui.red.label{background-color:#db2828!important;border-color:#db2828!important;color:#fff!important}.ui.blue.label{background-color:#2185d0!important;border-color:#2185d0!important;color:#fff!important}.ui.small.label{font-size:.7857rem}.ui.label{font-size:.8571rem}.ui.popup{background-color:#fff;background-position:initial initial;background-repeat:initial initial;border:1px solid #d4d4d5;border-radius:.2857rem;box-shadow:rgba(34,36,38,.1176) 0 2px 4px 0,rgba(34,36,38,.149) 0 2px 10px 0;color:rgba(0,0,0,.8705);display:none;font-style:normal;font-weight:400;line-height:1.4285em;max-width:250px;min-width:-webkit-min-content;padding:.833em 1em;position:absolute;right:0;top:0;z-index:1900}.ui.popup:before{-webkit-transform:rotate(45deg);background-color:#fff;background-position:initial initial;background-repeat:initial initial;box-shadow:#bababc 1px 1px 0 0;content:"";height:.7142em;position:absolute;width:.7142em;z-index:2}[data-tooltip]{position:relative}[data-tooltip]:before{background-color:#fff;background-position:initial initial;background-repeat:initial initial;box-shadow:#bababc 1px 1px 0 0;content:"";font-size:1rem;height:.7142em;position:absolute;width:.7142em;z-index:2}[data-tooltip]:after{background-color:#fff;background-position:initial initial;background-repeat:initial initial;border:1px solid #d4d4d5;border-radius:.2857rem;box-shadow:rgba(34,36,38,.1176) 0 2px 4px 0,rgba(34,36,38,.149) 0 2px 10px 0;color:rgba(0,0,0,.8705);content:attr(data-tooltip);font-size:1rem;font-style:normal;font-weight:400;line-height:1.4285em;max-width:none;padding:.833em 1em;position:absolute;text-align:left;text-transform:none;white-space:nowrap;z-index:1}[data-tooltip]:after,[data-tooltip]:before{pointer-events:none;visibility:hidden}[data-tooltip]:before{-webkit-transform:rotate(45deg) scale(0)!important;-webkit-transform-origin:50% 0;opacity:0;transition:all .1s ease}[data-tooltip]:after{-webkit-transform:translatex(-50%) scale(0)!important;-webkit-transform-origin:50% 100%;opacity:1;transition:all .1s ease}[data-tooltip][data-position=right\ center]:after{-webkit-transform:translatey(-50%) scale(0)!important}[data-position=right\ center][data-tooltip]:after{-webkit-transform:translatey(-50%);left:100%;margin-left:.5em;top:50%}[data-position=right\ center][data-tooltip]:before{-webkit-transform-origin:100% 50%;background-color:#fff;background-position:initial initial;background-repeat:initial initial;box-shadow:#bababc -1px 1px 0 0;left:100%;margin-left:.1428rem;margin-top:-.0714rem;top:50%}[data-position=right\ center][data-tooltip]:after{-webkit-transform-origin:0 50%}.ui.popup{margin:0}.ui.wide.popup{max-width:350px}@media only screen and (max-width:767px){.ui.wide.popup{max-width:250px}}.ui.popup{font-size:1rem}.ui.form .field>label{color:rgba(0,0,0,.8705);display:block;font-size:.9285em;font-weight:700;margin:0 0 .2857rem;text-transform:none}.ui.form .error.message{display:none}.ui.modal{-webkit-transform-origin:50% 25%;-webkit-user-select:text;background-color:#fff;background-position:initial initial;background-repeat:initial initial;border:0;border-radius:.2857rem;box-shadow:rgba(0,0,0,.2) 1px 3px 3px 0,rgba(0,0,0,.2) 1px 3px 15px 2px;display:none;left:50%;position:fixed;text-align:left;top:50%;z-index:1001}.ui.modal>:first-child:not(.icon){border-top-left-radius:.2857rem;border-top-right-radius:.2857rem}.ui.modal>:last-child{border-bottom-left-radius:.2857rem;border-bottom-right-radius:.2857rem}.ui.modal>.header{background-color:#fff;background-position:initial initial;background-repeat:initial initial;border-bottom-color:rgba(34,36,38,.149);border-bottom-style:solid;border-bottom-width:1px;box-shadow:none;color:rgba(0,0,0,.8509);display:block;font-family:Lato,Helvetica Neue,Arial,Helvetica,sans-serif;margin:0;padding:1.25rem 1.5rem}.ui.modal>.header:not(.ui){font-size:1.4285rem;font-weight:700;line-height:1.2857em}.ui.modal>.content{background-color:#fff;background-position:initial initial;background-repeat:initial initial;display:block;font-size:1em;line-height:1.4;padding:1.5rem;width:100%}.ui.modal>.content>.description{-webkit-box-flex:1;display:block;min-width:0}.ui.modal>.actions{background-color:#f9fafb;background-position:initial initial;background-repeat:initial initial;border-top-color:rgba(34,36,38,.149);border-top-style:solid;border-top-width:1px;padding:1rem;text-align:right}.ui.modal .actions>.button{margin-left:.75em}@media only screen and (max-width:767px){.ui.modal{margin:0 0 0 -47.5%;width:95%}}@media only screen and (min-width:8in){.ui.modal{margin:0 0 0 -44%;width:88%}}@media only screen and (min-width:62pc){.ui.modal{margin:0 0 0 -425px;width:850px}}@media only screen and (min-width:75pc){.ui.modal{margin:0 0 0 -450px;width:900px}}@media only screen and (min-width:20in){.ui.modal{margin:0 0 0 -475px;width:950px}}@media only screen and (max-width:991px){.ui.modal>.header{padding-right:2.25rem}}@media only screen and (max-width:767px){.ui.modal>.header{padding:.75rem 2.25rem .75rem 1rem!important}.ui.modal>.content{display:block;padding:1rem!important}.ui.modal .content>.description{box-shadow:none;display:block;margin:0!important;padding:1rem 0!important;width:100%!important}.ui.modal>.actions{padding:1rem 1rem 0!important}.ui.modal .actions>.button{margin-bottom:1rem}}.ui.modal{font-size:1rem}.ui.dropdown{-webkit-tap-highlight-color:transparent;cursor:pointer;display:inline-block;outline:0;position:relative;text-align:left;transition:box-shadow .1s ease,width .1s ease}.ui.dropdown .menu{background-color:#fff;background-position:initial initial;background-repeat:initial initial;border:1px solid rgba(34,36,38,.149);border-radius:.2857rem;box-shadow:rgba(34,36,38,.149) 0 2px 3px 0;cursor:auto;display:none;font-size:1em;margin:0;min-width:-webkit-max-content;outline:0;padding:0;position:absolute;text-align:left;text-shadow:none;top:100%;transition:opacity .1s ease;z-index:11}.ui.dropdown .menu>*{white-space:nowrap}.ui.dropdown .menu>.item{border:0;box-shadow:none;color:rgba(0,0,0,.8705);cursor:pointer;display:block;font-size:1rem;font-weight:400;height:auto;line-height:1em;padding:.7857rem 1.1428rem!important;position:relative;text-align:left;text-transform:none}.ui.dropdown .menu>.item:first-child{border-top-width:0}.ui.dropdown .menu>.header{color:rgba(0,0,0,.8509);font-size:.7857em;font-weight:700;margin:1rem 0 .75rem;padding:0 1.1428rem;text-transform:uppercase}.ui.dropdown .menu>.input{display:-webkit-box;margin:1.1428rem .7857rem;min-width:10rem;width:auto}.ui.dropdown .menu>.input:not(.transparent) input{padding:.5em 1em}.ui.dropdown .menu>.input:not(.transparent) .icon{padding-bottom:.5em;padding-top:.5em}.ui.dropdown .menu .menu{border-radius:.2857rem;left:100%!important;margin:0 0 0 -.5em!important;right:auto!important;top:0!important;z-index:21!important}.ui.dropdown .menu .menu:after,.ui.menu .ui.dropdown .menu>.item:before{display:none}.ui.dropdown .menu{left:0}.ui.dropdown .right.menu>.menu{border-radius:.2857rem;left:100%!important;right:auto!important}.ui.dropdown .scrolling.menu{border-radius:0;border-style:solid none none;border-top-color:rgba(34,36,38,.149);border-top-width:1px;box-shadow:none!important;margin:0!important;min-width:100%!important;overflow-x:hidden;overflow-y:auto;position:static;width:auto!important}.ui.dropdown .scrolling.menu>.item{border-top-style:none;padding-right:calc(1.1428rem + 17px)!important}.ui.dropdown .scrolling.menu .item:first-child{border-top-style:none}@media only screen and (max-width:767px){.ui.dropdown .scrolling.menu{max-height:10.2857rem}}@media only screen and (min-width:8in){.ui.dropdown .scrolling.menu{max-height:15.4285rem}}@media only screen and (min-width:62pc){.ui.dropdown .scrolling.menu{max-height:20.5714rem}}@media only screen and (min-width:20in){.ui.dropdown .scrolling.menu{max-height:20.5714rem}}.ui.floating.dropdown .menu{border-radius:.2857rem;box-shadow:rgba(34,36,38,.1176) 0 2px 4px 0,rgba(34,36,38,.149) 0 2px 10px 0!important;left:0;right:auto}.ui.floating.dropdown>.menu{border-radius:.2857rem;margin-top:.5em!important}.ui.sticky{position:static;transition:none;z-index:800}.ui.sticky.fixed{left:auto;position:fixed;right:auto}.ui.sticky.fixed.top{bottom:auto;top:0}
</style>


    
  <style>
    .hll { background-color: #ffffcc }
.pyg-c { color: #408080; font-style: italic } /* Comment */
.pyg-err { border: 1px solid #FF0000 } /* Error */
.pyg-k { color: #008000; font-weight: bold } /* Keyword */
.pyg-o { color: #666666 } /* Operator */
.pyg-ch { color: #408080; font-style: italic } /* Comment.Hashbang */
.pyg-cm { color: #408080; font-style: italic } /* Comment.Multiline */
.pyg-cp { color: #BC7A00 } /* Comment.Preproc */
.pyg-cpf { color: #408080; font-style: italic } /* Comment.PreprocFile */
.pyg-c1 { color: #408080; font-style: italic } /* Comment.Single */
.pyg-cs { color: #408080; font-style: italic } /* Comment.Special */
.pyg-gd { color: #A00000 } /* Generic.Deleted */
.pyg-ge { font-style: italic } /* Generic.Emph */
.pyg-gr { color: #FF0000 } /* Generic.Error */
.pyg-gh { color: #000080; font-weight: bold } /* Generic.Heading */
.pyg-gi { color: #00A000 } /* Generic.Inserted */
.pyg-go { color: #888888 } /* Generic.Output */
.pyg-gp { color: #000080; font-weight: bold } /* Generic.Prompt */
.pyg-gs { font-weight: bold } /* Generic.Strong */
.pyg-gu { color: #800080; font-weight: bold } /* Generic.Subheading */
.pyg-gt { color: #0044DD } /* Generic.Traceback */
.pyg-kc { color: #008000; font-weight: bold } /* Keyword.Constant */
.pyg-kd { color: #008000; font-weight: bold } /* Keyword.Declaration */
.pyg-kn { color: #008000; font-weight: bold } /* Keyword.Namespace */
.pyg-kp { color: #008000 } /* Keyword.Pseudo */
.pyg-kr { color: #008000; font-weight: bold } /* Keyword.Reserved */
.pyg-kt { color: #B00040 } /* Keyword.Type */
.pyg-m { color: #666666 } /* Literal.Number */
.pyg-s { color: #BA2121 } /* Literal.String */
.pyg-na { color: #7D9029 } /* Name.Attribute */
.pyg-nb { color: #008000 } /* Name.Builtin */
.pyg-nc { color: #0000FF; font-weight: bold } /* Name.Class */
.pyg-no { color: #880000 } /* Name.Constant */
.pyg-nd { color: #AA22FF } /* Name.Decorator */
.pyg-ni { color: #999999; font-weight: bold } /* Name.Entity */
.pyg-ne { color: #D2413A; font-weight: bold } /* Name.Exception */
.pyg-nf { color: #0000FF } /* Name.Function */
.pyg-nl { color: #A0A000 } /* Name.Label */
.pyg-nn { color: #0000FF; font-weight: bold } /* Name.Namespace */
.pyg-nt { color: #008000; font-weight: bold } /* Name.Tag */
.pyg-nv { color: #19177C } /* Name.Variable */
.pyg-ow { color: #AA22FF; font-weight: bold } /* Operator.Word */
.pyg-w { color: #bbbbbb } /* Text.Whitespace */
.pyg-mb { color: #666666 } /* Literal.Number.Bin */
.pyg-mf { color: #666666 } /* Literal.Number.Float */
.pyg-mh { color: #666666 } /* Literal.Number.Hex */
.pyg-mi { color: #666666 } /* Literal.Number.Integer */
.pyg-mo { color: #666666 } /* Literal.Number.Oct */
.pyg-sa { color: #BA2121 } /* Literal.String.Affix */
.pyg-sb { color: #BA2121 } /* Literal.String.Backtick */
.pyg-sc { color: #BA2121 } /* Literal.String.Char */
.pyg-dl { color: #BA2121 } /* Literal.String.Delimiter */
.pyg-sd { color: #BA2121; font-style: italic } /* Literal.String.Doc */
.pyg-s2 { color: #BA2121 } /* Literal.String.Double */
.pyg-se { color: #BB6622; font-weight: bold } /* Literal.String.Escape */
.pyg-sh { color: #BA2121 } /* Literal.String.Heredoc */
.pyg-si { color: #BB6688; font-weight: bold } /* Literal.String.Interpol */
.pyg-sx { color: #008000 } /* Literal.String.Other */
.pyg-sr { color: #BB6688 } /* Literal.String.Regex */
.pyg-s1 { color: #BA2121 } /* Literal.String.Single */
.pyg-ss { color: #19177C } /* Literal.String.Symbol */
.pyg-bp { color: #008000 } /* Name.Builtin.Pseudo */
.pyg-fm { color: #0000FF } /* Name.Function.Magic */
.pyg-vc { color: #19177C } /* Name.Variable.Class */
.pyg-vg { color: #19177C } /* Name.Variable.Global */
.pyg-vi { color: #19177C } /* Name.Variable.Instance */
.pyg-vm { color: #19177C } /* Name.Variable.Magic */
.pyg-il { color: #666666 } /* Literal.Number.Integer.Long */
  </style>

  </head>

  <body>
    <div class="ui darkblue top fixed inverted menu" role="navigation" itemscope itemtype="http://www.schema.org/SiteNavigationElement" style="height: 40px; z-index: 1000;">
      <a class="ui header item " href="/" >rdrr.io<!-- <small>R Package Documentation</small>--></a>
      <a class='ui item ' href="/find/" itemprop="url" ><i class='search icon'></i><span itemprop="name">Find an R package</span></a>
      <a class='ui item ' href="/r/" itemprop="url" ><i class='file text outline icon'></i> <span itemprop="name">R language docs</span></a>
      <a class='ui item ' href="/snippets/" itemprop="url" ><i class='play icon'></i> <span itemprop="name">Run R in your browser</span></a>
      <a class='ui item' href="https://rnotebook.io" target="_blank" rel="noopener"><i class='lab icon'></i> R Notebooks</a>

      <div class='right menu'>
        <form class='item' method='GET' action='/search'>
          <div class='ui right action input'>
            <input type='text' placeholder='packages, doc text, code...' size='24' name='q'>
            <button type="submit" class="ui green icon button"><i class='search icon'></i></button>
          </div>
        </form>
      </div>
    </div>

    
  
<div style='width: 280px;' class='only-desktop'>
  <div class='ui bound top sticky' style='padding-top: 40px;'>
    <div class='ui vertical menu bg-grey' style='width: 280px;'>
      <a class='header  item' href='/github/brouwern/wildlifeR/' style='padding-bottom: 4px' >
        <h3 class='ui header' style='margin-bottom: 4px'>
          brouwern/wildlifeR
          <div class='sub header'>Wildlife biology and animal ecology datasets and example analyses.</div>
        </h3>
        <small style='padding: 0 0 16px 0px' class='fakelink'>Package index</small>
      </a>

      <div class='header item'>
        <p>Share</p>

        
          <a class='ui huge twitter icon button' style="margin-right: 0px; margin-bottom: 2px; vertical-align: middle; padding: 5px 3px; height: 30px; width: 30px; " data-tooltip="Tweet this page" data-position="right center" href="https://twitter.com/intent/tweet?text=brouwern%2FwildlifeR+source%3A+R%2FAOU_species_codes.R&amp;url=https%3A%2F%2Frdrr.io%2Fgithub%2Fbrouwern%2FwildlifeR%2Fsrc%2FR%2FAOU_species_codes.R" target="_blank" ><i class='twitter icon'></i></a>
        
          <a class='ui huge facebook icon button' style="margin-right: 0px; margin-bottom: 2px; vertical-align: middle; padding: 5px 3px; height: 30px; width: 30px; " data-tooltip="Share on Facebook" data-position="right center" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Frdrr.io%2Fgithub%2Fbrouwern%2FwildlifeR%2Fsrc%2FR%2FAOU_species_codes.R" target="_blank" ><i class='facebook icon'></i></a>
        
          <a class='ui huge linkedin icon button' style="margin-right: 0px; margin-bottom: 2px; vertical-align: middle; padding: 5px 3px; height: 30px; width: 30px; " data-tooltip="Share on LinkedIn" data-position="right center" href="https://www.linkedin.com/shareArticle?mini=true&amp;summary=R%2FAOU_species_codes.R+defines+the+following+functions%3A+&amp;title=brouwern%2FwildlifeR+source%3A+R%2FAOU_species_codes.R&amp;url=https%3A%2F%2Frdrr.io%2Fgithub%2Fbrouwern%2FwildlifeR%2Fsrc%2FR%2FAOU_species_codes.R" target="_blank" ><i class='linkedin icon'></i></a>
        
          <a class='ui huge google plus icon button' style="margin-right: 0px; margin-bottom: 2px; vertical-align: middle; padding: 5px 3px; height: 30px; width: 30px; " data-tooltip="Post on Google+" data-position="right center" href="https://plus.google.com/share?url=https%3A%2F%2Frdrr.io%2Fgithub%2Fbrouwern%2FwildlifeR%2Fsrc%2FR%2FAOU_species_codes.R" target="_blank" ><i class='google plus icon'></i></a>
        
          <a class='ui huge reddit icon button' style="margin-right: 0px; margin-bottom: 2px; vertical-align: middle; padding: 5px 3px; height: 30px; width: 30px; background-color: #ff4500; color: #ffffff;" data-tooltip="Share on Reddit" data-position="right center" href="https://reddit.com/submit?url=https%3A%2F%2Frdrr.io%2Fgithub%2Fbrouwern%2FwildlifeR%2Fsrc%2FR%2FAOU_species_codes.R&amp;title=brouwern%2FwildlifeR+source%3A+R%2FAOU_species_codes.R" target="_blank" ><i class='reddit icon'></i></a>
        
          <a class='ui huge weibo icon button' style="margin-right: 0px; margin-bottom: 2px; vertical-align: middle; padding: 5px 3px; height: 30px; width: 30px; background-color: #f56770; color: #ffffff;" data-tooltip="Share on Weibo" data-position="right center" href="http://service.weibo.com/share/share.php?url=https%3A%2F%2Frdrr.io%2Fgithub%2Fbrouwern%2FwildlifeR%2Fsrc%2FR%2FAOU_species_codes.R&amp;title=brouwern%2FwildlifeR+source%3A+R%2FAOU_species_codes.R" target="_blank" ><i class='weibo icon'></i></a>
        
          <a class='ui huge hacker news icon button' style="margin-right: 0px; margin-bottom: 2px; vertical-align: middle; padding: 5px 3px; height: 30px; width: 30px; background-color: #ff6600; color: #ffffff;" data-tooltip="Post on Hacker News" data-position="right center" href="http://news.ycombinator.com/submitlink?u=https%3A%2F%2Frdrr.io%2Fgithub%2Fbrouwern%2FwildlifeR%2Fsrc%2FR%2FAOU_species_codes.R&amp;t=brouwern%2FwildlifeR+source%3A+R%2FAOU_species_codes.R" target="_blank" ><i class='hacker news icon'></i></a>
        
      </div>
      
      <form class='item' method='GET' action='/search'>
        <div class='sub header' style='margin-bottom: 4px'>Search the brouwern/wildlifeR package</div>
        <div class='ui action input' style='padding-right: 32px'>
          <input type='hidden' name='package' value='brouwern/wildlifeR'>
          <input type='hidden' name='repo' value='github'>
          <input type='text' placeholder='' name='q'>
          <button type="submit" class="ui green icon button">
            <i class="search icon"></i>
          </button>
        </div>
      </form>

      

      
<div class='ui floating dropdown item finder '>
  <b><a href='/github/brouwern/wildlifeR/man/' >Man pages</a></b> <div class='ui blue label'>23</div>
  <i class='caret right icon'></i>
  
    <small>
      <ul style='list-style-type: none; margin: 8px auto 0; line-height: 1.9; padding-left: 8px;'>
        
          <li style='white-space: nowrap; text-overflow: clip; overflow: hidden;'><a href='/github/brouwern/wildlifeR/man/BBS_PA_combo_cover_1km.html' ><b>BBS_PA_combo_cover_1km: </b>Combinations of NLCD land cover classes into more general...</a></li>
        
          <li style='white-space: nowrap; text-overflow: clip; overflow: hidden;'><a href='/github/brouwern/wildlifeR/man/BBS_PA_SCTA.html' ><b>BBS_PA_SCTA: </b>Number of Scarlet tanagers (SCTA) observed on Pennsylvania...</a></li>
        
          <li style='white-space: nowrap; text-overflow: clip; overflow: hidden;'><a href='/github/brouwern/wildlifeR/man/brook_trout.html' ><b>brook_trout: </b>Brook trout impacts on Chinook salmon survival - original...</a></li>
        
          <li style='white-space: nowrap; text-overflow: clip; overflow: hidden;'><a href='/github/brouwern/wildlifeR/man/doves_PA.html' ><b>doves_PA: </b>PA Mourning doves</a></li>
        
          <li style='white-space: nowrap; text-overflow: clip; overflow: hidden;'><a href='/github/brouwern/wildlifeR/man/plotTukeysHSD.html' ><b>plotTukeysHSD: </b>Plot output of TukeyHSD() function when there are 3 groups</a></li>
        
          <li style='white-space: nowrap; text-overflow: clip; overflow: hidden;'><a href='/github/brouwern/wildlifeR/man/sample_BBS_routes.html' ><b>sample_BBS_routes: </b>Select random subset of Breeding Bird Survey (BBS) routes</a></li>
        
          <li style='white-space: nowrap; text-overflow: clip; overflow: hidden;'><a href='/github/brouwern/wildlifeR/man/trillium.html' ><b>trillium: </b>Data on the size of Trillium from several sites in Crawford...</a></li>
        
        <li style='padding-top: 4px; padding-bottom: 0;'><a href='/github/brouwern/wildlifeR/man/' ><b>Browse all...</b></a></li>
      </ul>
    </small>
  
  <div class="right menu">
    <div class="ui icon search input" style='width: 350px'>
      <i class="search icon isearch-icon" data-type='man'></i>
      <input class='sidebar-isearch' type="text" placeholder="Search man pages..." data-type='man' data-pid='357763'>
    </div>
    <div class='header isearch-popular' data-type='man'>Popular Man pages</div>
    <div class="scrolling menu isearch-results" data-type='man' style='width: 300px'>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/BBS_PA_combo_cover_1km.html' >
          
            <b>BBS_PA_combo_cover_1km: </b>Combinations of NLCD land cover classes into more general...
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/BBS_PA_SCTA.html' >
          
            <b>BBS_PA_SCTA: </b>Number of Scarlet tanagers (SCTA) observed on Pennsylvania...
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/brook_trout.html' >
          
            <b>brook_trout: </b>Brook trout impacts on Chinook salmon survival - original...
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/doves_PA.html' >
          
            <b>doves_PA: </b>PA Mourning doves
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/plotTukeysHSD.html' >
          
            <b>plotTukeysHSD: </b>Plot output of TukeyHSD() function when there are 3 groups
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/sample_BBS_routes.html' >
          
            <b>sample_BBS_routes: </b>Select random subset of Breeding Bird Survey (BBS) routes
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/trillium.html' >
          
            <b>trillium: </b>Data on the size of Trillium from several sites in Crawford...
          
        </a>
      
    </div>
    <a class="item" href='/github/brouwern/wildlifeR/man/' ><b>Browse all...</b></a>
  </div>
  
</div>

      
<div class='ui floating dropdown item finder '>
  <b><a href='/github/brouwern/wildlifeR/api/' >API</a></b> <div class='ui blue label'>30</div>
  <i class='caret right icon'></i>
  
  <div class="right menu">
    <div class="ui icon search input" style='width: 350px'>
      <i class="search icon isearch-icon" data-type='tag'></i>
      <input class='sidebar-isearch' type="text" placeholder="Search API..." data-type='tag' data-pid='357763'>
    </div>
    <div class='header isearch-popular' data-type='tag'>Popular API</div>
    <div class="scrolling menu isearch-results" data-type='tag' style='width: 300px'>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/woodcock_MI_3_years.html' >
          
            woodcock_MI_3_years
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/wetlands.html' >
          
            wetlands
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/trillium.html' >
          
            trillium
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/sample_dove_routes.html' >
          
            sample_dove_routes
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/sample_BBS_routes.html' >
          
            sample_BBS_routes
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/plotTukeysHSD.html' >
          
            plotTukeysHSD
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/man/pikas.html' >
          
            pikas
          
        </a>
      
    </div>
    <a class="item" href='/github/brouwern/wildlifeR/api/' ><b>Browse all...</b></a>
  </div>
  
    <b>
      <a href='/github/brouwern/wildlifeR/api/' >
        <small style='padding: 0 0 16px 0px' class='fakelink'>Browse all...</small>
      </a>
    </b>
  
</div>

      
<div class='ui floating dropdown item finder active'>
  <b><a href='/github/brouwern/wildlifeR/f/' >Source code</a></b> <div class='ui blue label'>33</div>
  <i class='caret right icon'></i>
  
  <div class="right menu">
    <div class="ui icon search input" style='width: 350px'>
      <i class="search icon isearch-icon" data-type='src'></i>
      <input class='sidebar-isearch' type="text" placeholder="Search source code..." data-type='src' data-pid='357763'>
    </div>
    <div class='header isearch-popular' data-type='src'>Popular Source code</div>
    <div class="scrolling menu isearch-results" data-type='src' style='width: 300px'>
      
        <a class="item" href='/github/brouwern/wildlifeR/src/vignettes/reporting_t_test_results.R' >
          
            vignettes/reporting_t_test_results.R
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/src/vignettes/Inference_by_eye.R' >
          
            vignettes/Inference_by_eye.R
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/src/vignettes/ANOVA_deer_antlers.R' >
          
            vignettes/ANOVA_deer_antlers.R
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/src/inst/extdata/term_paper_materials/term_paper_example_submissions/term_paper_regression_example/Brouwer_NL_analysis_script_PIWO_vs_forest_cover.R' >
          
            inst/extdata/term_paper_materials/term_paper_example_submissions/term_paper_regression_example/Brouwer_NL_analysis_script_PIWO_vs_forest_cover.R
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/src/inst/extdata/term_paper_materials/term_paper_example_submissions/term_paper_ANOVA_example/Brouwer_NL.R' >
          
            inst/extdata/term_paper_materials/term_paper_example_submissions/term_paper_ANOVA_example/Brouwer_NL.R
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/src/inst/extdata/term_paper_materials/reproducible_analysis_script_full_wildlifeR_workflow/reproducible_analysis_script_full_wildlifeR_workflow.R' >
          
            inst/extdata/term_paper_materials/reproducible_analysis_script_full_wildlifeR_workflow/reproducible_analysis_script_full_wildlifeR_workflow.R
          
        </a>
      
        <a class="item" href='/github/brouwern/wildlifeR/src/docs/articles/reporting_t_test_results.R' >
          
            docs/articles/reporting_t_test_results.R
          
        </a>
      
    </div>
    <a class="item" href='/github/brouwern/wildlifeR/f/' ><b>Browse all...</b></a>
  </div>
  
    <b>
      <a href='/github/brouwern/wildlifeR/f/' >
        <small style='padding: 0 0 16px 0px' class='fakelink'>Browse all...</small>
      </a>
    </b>
  
</div>

    </div>
  </div>
</div>


  <div class='desktop-pad' id='body-content'>
    <div class='ui fluid container bc-row'>
      <div class='ui breadcrumb' itemscope itemtype="http://schema.org/BreadcrumbList">
        <a class='section' href="/">Home</a>

        <div class='divider'> / </div>

        <span itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
          <a class='section' itemscope itemtype="http://schema.org/Thing" itemprop="item" href="/all/github/">
            <span itemprop="name">GitHub</span>
          </a>
          <meta itemprop="position" content="1" />
        </span>

        <div class='divider'> / </div>

        <span itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
          <a class='section' itemscope itemtype="http://schema.org/Thing" itemprop="item" href="/github/brouwern/wildlifeR">
            <span itemprop="name">brouwern/wildlifeR</span>
          </a>
          <meta itemprop="position" content="2" />
        </span>

        <div class='divider'> / </div>

        <span itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="active section">
          <a class='active section' itemscope itemtype="http://schema.org/Thing" itemprop="item" href="https://rdrr.io/github/brouwern/wildlifeR/src/R/AOU_species_codes.R">
            <span itemprop="name">R/AOU_species_codes.R</span>
          </a>
          <meta itemprop="position" content="3" />
        </span>
      </div>
    </div>

    <div class="ui fluid container" style='padding: 0px 16px'>
      <div class='only-desktop' style='float: right; width: 300px; height: 600px;'><!-- rpackages-default -->
<ins class="adsbygoogle"
style="display:block;min-width:120px;max-width:300px;width:100%;height:600px"
data-ad-client="ca-pub-6535703173049909"
data-ad-slot="9724778181"
data-ad-format="vertical"></ins></div>
      <h1 class='ui block header fit-content'>R/AOU_species_codes.R
        <div class='sub header'>In <a href='/github/brouwern/wildlifeR/'>brouwern/wildlifeR: Wildlife biology and animal ecology datasets and example analyses.</a>
      </h1>

      

      

      <div class="highlight"><pre style="word-wrap: break-word; white-space: pre-wrap;"><span></span><span class="pyg-c1">#&#39; American Ornithological Union (AOU) species codes for North-American birds</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; A dataframe containing the common names (eg &quot;Scarlet Tanager&quot;),</span>
<span class="pyg-c1">#&#39; AOU alphabetic code (eg &quot;SCTA&quot;) and AOU numeric code (eg. 6080)</span>
<span class="pyg-c1">#&#39; The common name and alphabetic codes are eay to locate for a given species online.</span>
<span class="pyg-c1">#&#39; The AOU numeric code is needed because the actual BBS dataframe does not</span>
<span class="pyg-c1">#&#39; contain species names, just the numeric codes.</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; Some records from offical list have been removed because they don&#39;t have stable names, eg., they are a defined species.</span>
<span class="pyg-c1">#&#39; Note that the row number (aka line number) DOES NOT equal the AOU code.  When</span>
<span class="pyg-c1">#&#39; access these data be sure to be clear whether you are using the line number</span>
<span class="pyg-c1">#&#39; or using the actual code.  See below for examples.</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; @format A data frame...</span>
<span class="pyg-c1">#&#39; \describe{</span>
<span class="pyg-c1">#&#39;   \item{spp.num}{Numeric AOU species codes. Typically 4 numbers}</span>
<span class="pyg-c1">#&#39;   \item{alpha.code}{4-letter AOCUspecies code}</span>
<span class="pyg-c1">#&#39;   \item{name}{Common name of species}</span>
<span class="pyg-c1">#&#39;   \item{spp}{Latin binomial genus and species}</span>
<span class="pyg-c1">#&#39;   \item{order}{code for taxonomic order}</span>
<span class="pyg-c1">#&#39;  }</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; @examples</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; ## Example 1: Accessing basic information</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; ## Determine row number by species common name</span>
<span class="pyg-c1">#&#39; ### The Scarlet Tanager is in row 897 and has the AOU specied</span>
<span class="pyg-c1">#&#39; ### number (aka spp code) of 6080</span>
<span class="pyg-c1">#&#39; row.number.i &lt;- which(AOU_species_codes$name == &quot;Scarlet Tanager&quot;)</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; ## Determine row number by Aou alphabetic code</span>
<span class="pyg-c1">#&#39; row.number.i &lt;- which(AOU_species_codes$alpha.code == &quot;SCTA&quot;)</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; ## Access code by row / line number</span>
<span class="pyg-c1">#&#39; ### These are equivalent:</span>
<span class="pyg-c1">#&#39; AOU_species_codes[row.number.i,]</span>
<span class="pyg-c1">#&#39; AOU_species_codes[812,]</span>
<span class="pyg-c1">#&#39; #Load data on AOU species codes</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; ## Example 2: Seting up data for analysis of</span>
<span class="pyg-c1">#&#39; ### the relationship between abundance and landcover</span>
<span class="pyg-c1">#&#39; ### Focal species: European starling &quot;EUST&quot;</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; ### Which ROW NUMBER in the list of species codes</span>
<span class="pyg-c1">#&#39; #### does the European startling occur in?</span>
<span class="pyg-c1">#&#39; EUST.row.number &lt;- which(AOU_species_codes$alpha.code == &quot;EUST&quot;)</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; ### Look at just the EUST row of the</span>
<span class="pyg-c1">#&#39; #### AOU_species_codes dataframe</span>
<span class="pyg-c1">#&#39; AOU_species_codes[EUST.row.number,]</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; #### The numeric code for EUST is 494)</span>
<span class="pyg-c1">#&#39; #### save it to an object</span>
<span class="pyg-c1">#&#39; EUST.numeric.code &lt;- 4940</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; ### look at names of the columns in the BBS_PA data set with</span>
<span class="pyg-c1">#&#39; ### the data on bird abundance</span>
<span class="pyg-c1">#&#39; names(BBS_PA)</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; #### The column with the Aou species codes is called &quot;Aou&quot;</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; #### load dplyr package</span>
<span class="pyg-c1">#&#39; #library(dplyr)</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; #### Subset just the rows of data for the European startling</span>
<span class="pyg-c1">#&#39; #### That is, the rows where the Aou code = 4940</span>
<span class="pyg-c1">#&#39; #BBS_PA_EUST &lt;- BBS_PA %&gt;% filter(Aou == 4940)</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; #### See how the dataframe has change</span>
<span class="pyg-c1">#&#39; #dim(BBS_PA)</span>
<span class="pyg-c1">#&#39; #dim(BBS_PA_EUST)</span>
<span class="pyg-c1">#&#39; #summary(BBS_PA_EUST)</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; ## Save output</span>
<span class="pyg-c1">#&#39; ### data can be saved with write.csv(), eg:</span>
<span class="pyg-c1">#&#39; ### write.csv(BBS_PA_EUST, file = &quot;starling_abundance.csv&quot;)</span>
<span class="pyg-c1">#&#39;</span>
<span class="pyg-c1">#&#39; #### If you are studying how the abundance of a species changes</span>
<span class="pyg-c1">#&#39; #### as landcover changes you can now merge this subset of the data</span>
<span class="pyg-c1">#&#39; #### with the GIS landcover data.</span>




<span class="pyg-s">&quot;AOU_species_codes&quot;</span>
</pre></div>


      <div class='only-mobile' style='width: 320px; height: 100px; text-align: center;'><!-- rdrr-mobile-responsive -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-6535703173049909"
     data-ad-slot="4915028187"
     data-ad-format="auto"></ins></div>

      

      <small>brouwern/wildlifeR documentation built on Dec. 21, 2017, 8:04 a.m.</small>

    </div>
    
    

<div class="ui inverted darkblue vertical footer segment" style='margin-top: 16px; padding: 32px;'>
  <div class="ui center aligned container">
    <div class="ui stackable inverted divided three column centered grid">
      <div class="five wide column">
        <h4 class="ui inverted header">R Package Documentation</h4>
        <div class='ui inverted link list'>
          <a class='item' href='/' >rdrr.io home</a>
          <a class='item' href='/r/' >R language documentation</a>
          <a class='item' href='/snippets/' >Run R code online</a>
          <a class='item' href='https://rnotebook.io/' >Create free R Jupyter Notebooks</a>
        </div>
      </div>
      <div class="five wide column">
        <h4 class="ui inverted header">Browse R Packages</h4>
        <div class='ui inverted link list'>
          <a class='item' href='/all/cran/' >CRAN packages</a>
          <a class='item' href='/all/bioc/' >Bioconductor packages</a>
          <a class='item' href='/all/rforge/' >R-Forge packages</a>
          <a class='item' href='/all/github/' >GitHub packages</a>
        </div>
      </div>
      <div class="five wide column">
        <h4 class="ui inverted header">We want your feedback!</h4>
        <small>Note that we can't provide technical support on individual packages. You should contact the package authors for that.</small>
        <div class='ui inverted link list'>
          <a class='item' href="https://twitter.com/intent/tweet?screen_name=rdrrHQ" >
            <div class='ui large icon label twitter-button-colour'>
              <i class='whiteish twitter icon'></i> Tweet to @rdrrHQ
            </div>
          </a>

          <a class='item' href="https://github.com/rdrr-io/rdrr-issues/issues" >
            <div class='ui large icon label github-button-colour'>
              <i class='whiteish github icon'></i> GitHub issue tracker
            </div>
          </a>

          <a class='item' href="/cdn-cgi/l/email-protection#147d757a54796160716c787576673a777b79">
            <div class='ui teal large icon label'>
              <i class='whiteish mail outline icon'></i> <span class="__cf_email__" data-cfemail="cca5ada28ca1b9b8a9b4a0adaebfe2afa3a1">[email&#160;protected]</span>
            </div>
          </a>

          <a class='item' href="https://ianhowson.com" >
            <div class='ui inverted large image label'>
              <img class='ui avatar image' src='/static/images/ianhowson32.png'> <span class='whiteish'>Personal blog</span>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>
  <br />
</div>

  </div>


    <!-- suggestions button -->
    <div style='position: fixed; bottom: 2%; right: 2%; z-index: 1000;'>
      <div class="ui raised segment surveyPopup" style='display:none'>
  <div class="ui large header">What can we improve?</div>

  <div class='content'>
    <div class="ui form">
      <div class="field">
        <button class='ui fluid button surveyReasonButton'>The page or its content looks wrong</button>
      </div>

      <div class="field">
        <button class='ui fluid button surveyReasonButton'>I can't find what I'm looking for</button>
      </div>

      <div class="field">
        <button class='ui fluid button surveyReasonButton'>I have a suggestion</button>
      </div>

      <div class="field">
        <button class='ui fluid button surveyReasonButton'>Other</button>
      </div>

      <div class="field">
        <label>Extra info (optional)</label>
        <textarea class='surveyText' rows='3' placeholder="Please enter more detail, if you like. Leave your email address if you'd like us to get in contact with you."></textarea>
      </div>

      <div class='ui error message surveyError' style='display: none'></div>

      <button class='ui large fluid green disabled button surveySubmitButton'>Submit</button>
    </div>
  </div>
</div>

      <button class='ui blue labeled icon button surveyButton' style='display: none; float: right;'><i class="flag icon"></i> Improve this page</button>
    </div>

    <script data-cfasync="false" src="/cdn-cgi/scripts/af2821b0/cloudflare-static/email-decode.min.js"></script><script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

    
  


    <div class="ui modal snippetsModal">
  <div class="header">
    Embedding an R snippet on your website
  </div>
  <div class="content">
    <div class="description">
      <p>Add the following code to your website.</p>

      <p>
        <textarea class='codearea snippetEmbedCode' rows='5' style="font-family: Consolas,Monaco,'Andale Mono',monospace;">REMOVE THIS</textarea>
        <button class='ui blue button copyButton' data-clipboard-target='.snippetEmbedCode'>Copy to clipboard</button>
      </p>

      <p>For more information on customizing the embed code, read <a href='/snippets/embedding/'>Embedding Snippets</a>.</p>
    </div>
  </div>
  <div class="actions">
    <div class="ui button">Close</div>
  </div>
</div>

    
    <script type="text/javascript" src="/static/CACHE/js/61afda3e53e9.js"></script>

    
  

<script type="text/javascript">$(document).ready(function(){$('.snip-run').click(runClicked);var key='ctrl+enter';var txt=' (Ctrl-Enter)';if(navigator&&navigator.platform&&navigator.platform.startsWith&&navigator.platform.startsWith('Mac')){key='command+enter';txt=' (Cmd-Enter)';}
$('.snip-run').text('Run '+txt);Mousetrap.bind(key,function(e){if($('.snip-run').hasClass('disabled')){return;}
var faketarget=$('.snip-run')[0]
runClicked({currentTarget:faketarget});});});</script>



    
  
<link rel="stylesheet" href="/static/CACHE/css/a9d8529e0613.css" type="text/css" />



    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,400italic,600,600italic,800,800italic">
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Oswald:400,300,700">
  </body>
</html>
