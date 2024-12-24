<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>농산물 작황 정보</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        .wrapper {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
        }

        .header {
            display: flex;
            align-items: center;
            padding: 20px 0;
            border-bottom: 2px solid #ddd;
            border-radius: 10px;
        }

        .header img {
            margin-right: 10px;
            width: 40px;
            height: 40px;
        }

        .header h1 {
            font-size: 36px;
            color: #333;
            font-weight: bold;
            margin: 0;
        }

        .sub-header {
            font-size: 16px;
            color: #888;
            margin-top: 10px;
        }

        .tabs {
            margin-top: 20px;
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .tab {
            padding: 12px 25px;
            background-color: #f1f1f1;
            border-radius: 25px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .tab.active {
            background-color: #1d66ff;
            color: white;
        }

        .info-container {
            padding: 20px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .info-container h2 {
            color: #4CAF50;
            margin-top: 0;
            font-size: 24px;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 10px;
        }

        table,
        th,
        td {
            border: 1px solid #ddd;
            border-radius: 10px;
        }

        th,
        td {
            padding: 14px;
            text-align: left;
        }

        th {
            background-color: #f1f1f1;
        }

        .image-gallery {
            display: flex;
            gap: 10px;
            margin-top: 20px;
            overflow-x: auto;
            padding-bottom: 10px;
        }

        .image-gallery img {
            width: 90px;
            height: 90px;
            object-fit: cover;
            cursor: pointer;
            border-radius: 10px;
            transition: transform 0.3s;
        }

        .image-gallery img:hover {
            transform: scale(1.1);
        }

        .main-image {
            margin-top: 20px;
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .footer {
            font-size: 14px;
            color: #777;
            margin-top: 20px;
            text-align: right;
        }

        .footer span {
            font-weight: bold;
        }

        .info {
            margin-top: 30px;
            font-size: 16px;
        }

        .info p {
            margin: 5px 0;
        }

        .info span {
            font-weight: bold;
        }

        /* 반응형 디자인 */
        @media screen and (max-width: 768px) {
            .tabs {
                flex-direction: column;
            }

            .tab {
                padding: 10px;
                margin: 5px 0;
                font-size: 16px;
            }

            .info-container {
                padding: 15px;
            }

            .image-gallery {
                gap: 5px;
                flex-wrap: wrap;
            }

            .image-gallery img {
                width: 70px;
                height: 70px;
            }

            .main-image {
                height: 300px;
            }
        }

        /* 모바일 최적화 */
        @media screen and (max-width: 480px) {
            .header h1 {
                font-size: 28px;
            }

            .info-container h2 {
                font-size: 20px;
            }

            .footer {
                font-size: 12px;
            }
        }
    </style>
</head>

<body>

    <div class="wrapper">
        <div class="header">
            <img src="https://via.placeholder.com/220/0000FF/808080" alt="farmer icon">
            <div>
                <h1>산지 작황 Live</h1>
                <div class="sub-header">현장에서 전하는 생생한 농산물 작황 정보</div>
            </div>
        </div>

        <div class="tabs">
            <div class="tab active">고추</div>
            <div class="tab">배추</div>
            <div class="tab">양파</div>
            <div class="tab">무</div>
            <div class="tab">마늘</div>
        </div>

        <div class="info-container">
            <h2>농산물 작황 정보</h2>

            <table>
                <tr>
                    <th>조사일자</th>
                    <td>2023-09-18 ~ 2023-09-18</td>
                </tr>
                <tr>
                    <th>작형</th>
                    <td>건고추(일반) > 출하기(산지)</td>
                </tr>
                <tr>
                    <th>조사지역</th>
                    <td>경상북도 의성군 안계면</td>
                </tr>
                <tr>
                    <th>조사사유</th>
                    <td>작황</td>
                </tr>
                <tr>
                    <th>작황(전년대비)</th>
                    <td>나쁨</td>
                </tr>
                <tr>
                    <th>출하지시기</th>
                    <td>2023-09-11 ~ 2023-09-11</td>
                </tr>
                <tr>
                    <th>출하진행률</th>
                    <td>75%</td>
                </tr>
                <tr>
                    <th>저장(양함)동향</th>
                    <td>농가별 저장량은 많지 않음</td>
                </tr>
                <tr>
                    <th>병충해</th>
                    <td>담배나방, 탄저병</td>
                </tr>
                <tr>
                    <th>피해면적</th>
                    <td>13 ha, 전체면적의 2% 정도</td>
                </tr>
                <tr>
                    <th>병충해 피해율</th>
                    <td>10%</td>
                </tr>
                <tr>
                    <th>조사내용</th>
                    <td>- 현재 직화상황 : 생육 후기가 세력이 떨어짐<br>
                        -> 장기적으로 큰 피해를 봤던 탄저병 농가는 현재 거의 회생불가상태이고, 탄저병을 잘 관리하던 농가도 탄저병이 발생하여 일부 피해를 줌<br>
                        - 생육 후기가 착과되지 않으면 작사의 되지 않음<br>
                        - 기존 큰 온작자 농장이 있음
                    </td>
                </tr>
            </table>

            <img id="mainImage" src="https://via.placeholder.com/800" alt="메인 이미지" class="main-image">

            <div class="image-gallery">
                <img src="https://via.placeholder.com/160" alt="작황 이미지 1"
                    onclick="changeImage('https://via.placeholder.com/800')">
                <img src="https://via.placeholder.com/160/0000FF/808080" alt="작황 이미지 2"
                    onclick="changeImage('https://via.placeholder.com/800/0000FF/808080')">
                <img src="https://via.placeholder.com/160/FF6347/FFFFFF" alt="작황 이미지 3"
                    onclick="changeImage('https://via.placeholder.com/800/FF6347/FFFFFF')">
            </div>

            <div class="footer">
                <p>작성 <span>이주연</span> | 최종등록 <span>2023년 09월 20일</span></p>
            </div>
        </div>
    </div>

    <script>
        // 이미지 클릭 시 메인 이미지를 변경하는 함수
        function changeImage(imageSrc) {
            document.getElementById('mainImage').src = imageSrc;
        }

        // 탭 클릭 시 색상 변경
        const tabs = document.querySelectorAll('.tab');
        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                tabs.forEach(t => t.classList.remove('active'));
                tab.classList.add('active');
            });
        });
    </script>

</body>

</html>