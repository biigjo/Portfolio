<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- masonry 로딩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.0.0/masonry.pkgd.min.js"></script>
<!-- imagesloaded 로딩 (모든 이미지가 로딩된 후 실행되도록 할때 필요) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.0/imagesloaded.pkgd.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<section class="masonry-section">
    <div class="title-area">
        <h1 class="title-txt">Best Donators</h1>
        <h2 class="subtitle-txt"><span class="emphasis">Top 11 ~ 100 </span>Donations</h2>
    </div>
    <div id="masonryContainer" class="container">
    </div>
    <div class="btn-area">
        <button class="btn-view-more" onclick="javascript:indexViewMore();">
            <span class="btn-txt">View More</span>
        </button>
    </div>
</section>
<script>
$imgs = $('.container').imagesLoaded(function() {
    $imgs.masonry({
        itemSelector : '.item', // img 태그를 대상으로 masonry 적용
        fitWidth : true // 내용물을 가운데 정렬하기, CSS margin:0 auto; 설정이 필요함
    });
});

function indexViewMore() {
    var lastIndex = 0;
    if ((currentIndex + 10) < rankList.length) {
        lastIndex = currentIndex + 10;
    } else {
        lastIndex = rankList.length;
    }

    var htmlString = '';
    for (currentIndex; currentIndex < lastIndex; currentIndex++) {
        htmlString += '<div class="item">';
        htmlString += '    <img src="' + apiUrl + rankList[currentIndex]["thumbnailImageUrl"] + '" class="gg-image" onclick="javascript:goGallery(\'' + rankList[currentIndex]["userId"] + '\', \'' + rankList[currentIndex]["userName"] + '\', \'' + rankList[currentIndex]["countryCode"] + '\', \'' + rankList[currentIndex]["Cnt"] + '\', \'' + rankList[currentIndex]["photoUrl"] + '\', \'0\', \'' + rankList[currentIndex]["id"] + '\');">';
        htmlString += '    <div class="info">';
        htmlString += '        <div class="donee donee-' + rankList[currentIndex]["givingTargetId"] + '"></div>';
        htmlString += '        <div class="profile">';

        if (rankList[currentIndex]["photoUrl"]) {
            htmlString += '         <img src="' + apiUrl + rankList[currentIndex]["photoUrl"] + '">';
        } else {
            htmlString += '         <img class="null" src="">';
        }
        
        htmlString += '        </div>';
        htmlString += '        <div class="username">' + rankList[currentIndex]["userName"] + '</div>';
        htmlString += '        <div class="country">' + countryName(rankList[currentIndex]["countryCode"]) + '</div>';
        htmlString += '        <div class="tag-area">';

        for (var j = 0; j < rankList[currentIndex]["hashTags"].length; j++) {
            htmlString += '            <a class="tag">#' + rankList[currentIndex]["hashTags"][j] + '</a>';
        }//end for j

        htmlString += '        </div>';
        htmlString += '    </div>';
        htmlString += '</div>';
    }//end for currentIndex

    var localEl = $(htmlString);

    $('#masonryContainer').append(localEl).masonry('appended', localEl, true);

    setTimeout(function() {
        $('#masonryContainer').masonry();
    }, 50);

    setTimeout(function() {
        $('#masonryContainer').masonry();
    }, 50);
}
</script>
</body>
</html>