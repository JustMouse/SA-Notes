#/bin/bash
find . -name '*.html' -exec sed s/'<head>'/'<!-- Google tag (gtag.js) --><script async src="https://www.googletagmanager.com/gtag/js?id=G-CTQFQQMY65"></script><script>window.dataLayer = window.dataLayer || [];function gtag(){dataLayer.push(arguments);}gtag(\'js\', new Date());gtag(\'config\', \'G-CTQFQQMY65\');</script>'/g {} +
