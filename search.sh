#!/bin/bash

search_term="$1"
login_cookie="$2"

curl "https://www.youtube.com/results?search_query=$search_term&pbj=1" -H 'Host: www.youtube.com' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:57.0) Gecko/20100101 Firefox/57.0' -H 'Accept: */*' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://www.youtube.com/' -H 'X-YouTube-STS: 17564' -H 'X-YouTube-Client-Name: 1' -H 'X-YouTube-Client-Version: 2.20180207' -H 'X-YouTube-Page-CL: 184825130' -H 'X-YouTube-Page-Label: youtube.ytfe.desktop_20180207_0_RC1' -H 'X-YouTube-Variants-Checksum: cc5895935bae9e52ef21aad49ced86b5' -H 'X-SPF-Referer: https://www.youtube.com/' -H 'X-SPF-Previous: https://www.youtube.com/' -H "Cookie: $login_cookie" -H 'Connection: keep-alive' | grep -oE "(\/watch\?v=[^\"]*)" > search_result.txt

while read video; do
	curl "https://www.youtube.com$video&pbj=1" -H 'Host: www.youtube.com' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:57.0) Gecko/20100101 Firefox/57.0' -H 'Accept: */*' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://www.youtube.com/results?search_query=fast+cars' -H 'X-YouTube-STS: 17564' -H 'X-YouTube-Client-Name: 1' -H 'X-YouTube-Client-Version: 2.20180207' -H 'X-YouTube-Page-CL: 184825130' -H 'X-YouTube-Page-Label: youtube.ytfe.desktop_20180207_0_RC1' -H 'X-YouTube-Variants-Checksum: cc5895935bae9e52ef21aad49ced86b5' -H 'X-SPF-Referer: https://www.youtube.com/results?search_query=fast+cars' -H 'X-SPF-Previous: https://www.youtube.com/results?search_query=fast+cars' -H "Cookie: $login_cookie" -H 'Connection: keep-alive'

done < search_result.txt
