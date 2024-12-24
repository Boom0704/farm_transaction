# 푸른이음 프로젝트 (GreenBridge)

![License](https://img.shields.io/badge/license-MIT-blue)
![Spring](https://img.shields.io/badge/framework-Spring-brightgreen)

푸른이음은 도시농업에서 발생하는 잉여 농작물을 소비자와 연결하여 거래를 가능하게 하는 친환경 플랫폼입니다.  
도시와 자연을 이어주며, 농작물 낭비 해결과 지속 가능한 소비 문화를 확산하는 데 목표를 둔 프로젝트입니다.

---

## 📖 프로젝트 개요

- **프로젝트 이름**: 푸른이음 (GreenBridge)
- **주요 기능**:
  - **카카오 맵 API**를 이용한 거래 위치 자동 입력
  - **카카오 소셜 로그인**을 통한 간편한 사용자 인증
  - **머신러닝 기반** 이미지 판별로 판매글 자동 생성
  - **친환경 거래 촉진**을 위한 탄소 발걸음 포인트 시스템
- **주요 목표**:
  - 잉여 농작물 문제 해결
  - 탄소중립 실현
  - 도시농업 활성화 및 지속 가능한 소비 문화 확산

---

## 🚀 기술 스택

- **Frontend**: JSP, HTML/CSS
- **Backend**: Spring Framework
- **Build Tool**: Maven
- **Database**: Oracle Database
- **API Integration**:
  - [카카오 맵 API](https://developers.kakao.com/) (거래 위치 표시)
  - [카카오 소셜 로그인 API](https://developers.kakao.com/) (사용자 인증)
  - Custom ML API (머신러닝 기반 작물 판별)
- **Machine Learning**: TensorFlow (Image Recognition)

---

## 📂 프로젝트 구조

```plaintext
farm_transaction/
├── src/
│   ├── main/
│   │   ├── java/          # Java 백엔드 코드
│   │   ├── resources/     # 설정 파일 및 SQL 스크립트
│   │   └── webapp/        # JSP 및 Frontend 리소스
│   │       ├── WEB-INF/   # JSP 및 View 템플릿
│   │       └── static/    # 정적 파일 (CSS/JS)
├── pom.xml                # Maven 설정 파일
└── README.md              # 프로젝트 소개 파일
