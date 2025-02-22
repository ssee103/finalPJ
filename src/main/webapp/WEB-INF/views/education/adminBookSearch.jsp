<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Example</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bookAPI.css">
</head>

<body>
    <div class="search-header">
    </div>

    <div class="search-container">
        <input type="text" id="searchInput" placeholder="책 제목을 입력하세요" onkeydown="handleSearch(event)">
        <button onclick="searchBooks()">search</button> <!-- 검색 버튼 -->
    </div>

    <div id="searchResults" style="display: none;">
    </div>

    <div id="popupContainer" style="display: none;">
        <div id="popupContent" class="popup"></div>
    </div>

    <div id="paginationContainer" class="pagination" style="display: none;">
        <button id="prevButton" onclick="showPreviousPage()" disabled>이전 페이지</button>
        <button id="nextButton" onclick="showNextPage()" disabled>다음 페이지</button>
    </div>


    <script src="https://code.jquery.com/jquery-3.7.0.js"
        integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous">
    </script>
    
    <script>
    var isPopupOpen = false;
    var currentPage = 1;
    var itemsPerPage = 20;
    var totalItems = 0;

    function searchBooks(page) {
        var searchInput = $('#searchInput').val();
        page = page || 1; // 기본값: 1

        $.ajax({
            method: 'GET',
            url: 'https://dapi.kakao.com/v3/search/book',
            data: { query: searchInput, page: page },
            headers: { Authorization: "KakaoAK 50d753224767b8df6c6cc952f53afdf8" }
        })
            .done(function (response) {
                var books = response.documents;
                totalItems = books.length;

                var searchResults = $('#searchResults');
                searchResults.empty();

                if (totalItems === 0) {
                    searchResults.append('<p>검색 결과가 없습니다.</p>');
                    $('#paginationContainer').hide();
                } else {
                    var start = (page - 1) * itemsPerPage;
                    var end = start + itemsPerPage;
                    var displayedBooks = books.slice(start, end);

                    for (var i = 0; i < displayedBooks.length; i++) {
                        var book = displayedBooks[i];
                        var title = book.title;
                        var thumbnail = book.thumbnail;
                        var url = book.url;
                        var authors = book.authors;
                        var publisher = book.publisher;
                        var translators = book.translators;
                        var datetime = book.datetime;
                        var contents = book.contents;
                        var sale_price = book.sale_price;

                        var resultHtml = '<div class="book-item">';
                        resultHtml += '<img src="' + thumbnail + '" onclick="showDetails(\'' + title + '\', \'' + authors + '\', \'' + publisher + '\', \'' + translators + '\', \'' + datetime + '\', \'' + contents + '\', \'' + sale_price + '\', \'' + url + '\')"/>';
                        resultHtml += '</div>';

                        searchResults.append(resultHtml);
                    }

                    currentPage = page;
                    updatePaginationButtons();
                    $('#searchResults').show();
                    $('#paginationContainer').show();
                }
            })
            .fail(function (error) {
                console.error('책 검색에 실패했습니다:', error);
            });
    }

    function formatDate(date) {
        var year = date.substr(0, 4);
        var month = date.substr(5, 2);
        var day = date.substr(8, 2);
        return year + '-' + month + '-' + day;
    }

    function showDetails(title, authors, publisher, translators, datetime, contents, sale_price, url) {
        var popupContent = $('#popupContent');
        popupContent.empty();

        var formattedDate = formatDate(datetime);

        var details = '<p><b>제목:</b> ' + title + '</p>';
        details += '<p><b>저자:</b> ' + authors + '</p>';
        details += '<p><b>출판사:</b> ' + publisher + '</p>';
        details += '<p><b>번역자:</b> ' + translators + '</p>';
        details += '<p><b>출간일:</b> ' + formattedDate + '</p>';
        details += '<div><b>내용:</b> ' + contents + '</div>';
        details += '<p><b>판매 가격:</b> ' + sale_price + '원</p>';
        details += '<button onclick="window.open(\'' + url + '\')">추가 정보</button>';

        popupContent.html(details);

        var popupContainer = $('#popupContainer');
        popupContainer.fadeIn();
        isPopupOpen = true;
    }

    function updatePaginationButtons() {
        var prevButton = $('#prevButton');
        var nextButton = $('#nextButton');

        prevButton.prop('disabled', currentPage === 1);
        nextButton.prop('disabled', currentPage === Math.ceil(totalItems / itemsPerPage));
    }

    function showPreviousPage() {
        searchBooks(currentPage - 1);
    }

    function showNextPage() {
        searchBooks(currentPage + 1);
    }

    $(document).on('click', function (event) {
        var popupContainer = $('#popupContainer');
        if (!isPopupOpen && !$(event.target).closest('#popupContainer').length) {
            popupContainer.fadeOut();
        }
        isPopupOpen = false;
    });

    function handleSearch(event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            searchBooks();
        }
    }

    // Display quote on initial page load
    $(document).ready(function () {
        $('.quote').show();
    });
    </script>
</body>

</html>