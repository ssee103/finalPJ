# DDIT FinalProject HERMES
대덕인재 개발원 ddit 최종 프로젝트입니다.<br/>
작성자 : 403호 1조 TA 백승권

# 프로젝트 소개
기존의 HRMS 프로그램(인사관리 프로그램)과는 다른 차별성을 두기 위해 인사시스템 + 그룹웨어 기능을 탑재하면 시장에서 경쟁력이 있겠다는 생각으로 HERMES 프로젝트를 진행하게 되었습니다.

# 프로젝트 기간
2025.01.07 ~ 2025.03.11

# **주요 기능**
- 출·퇴근
  - 출·퇴근 버튼을 통해 출근 및 퇴근 등록 구현
  - 출·퇴근 목록 구현
 
- **결재 시스템**
  - 일반 결재를 통해 결재 승인, 반려 구현
  - 전결권을 부여받은 전결권자를 지정하고 전결권자는 전결을 할 수 있게 구현
  - 대결권자 또한 대결 구현
  - 결재라인 지정, 참조자 지정
 
- **사내 쪽지함**
  - 받은 쪽지와 보낸 쪽지를 확인
  - 휴지통으로 이동 기능과 복원 기능 구현
  - 완전 삭제 구현
 
- **사내 메신저**
  - 웹소켓을 통한 실시간 채팅 (1:1 혹은 단체채팅방)
  - 내가 읽지 않은 메시지 수, 채팅방 내 읽지 않은 사람의 수 구현
  - 방 나갈 시 자동으로 방장 위임, 아무도 없으면 방 사라짐

- **급여**
  - 급여 명세서 항목 중 공제항목 자동 계산을 위한 프로시저 구현
  - 급여 확정 시 해당 인원의 급여 목록에 표시
 
- **채용**
  - 채용 공고와 직접적인 채용은 회사 내부 프로그램 HERMES에서 동작
  - 채용 공고를 보고 지원할 입사자가 볼 회사 홈페이지는 리액트를 이용
 
# 기술스택
### 🚀 Backend
<img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/springsecurity-6DB33F?style=for-the-badge&logo=springsecurity&logoColor=white"> <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/node.js-339933?style=for-the-badge&logo=Node.js&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"> <img src="https://img.shields.io/badge/websocket-000000?style=for-the-badge&logo=websocket&logoColor=white">

### 🌐 Frontend
<img src="https://img.shields.io/badge/React-61DAFB?style=for-the-badge&logo=React&logoColor=black"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/Css-1572B6?style=for-the-badge&logo=Css&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">

### ⚡ CI/CD
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> <img src="https://img.shields.io/badge/svn-02303A?style=for-the-badge&logo=svn&logoColor=white">

### 💬 Communication
<img src="https://img.shields.io/badge/notion-000000?style=for-the-badge&logo=notion&logoColor=white">  <img src="https://img.shields.io/badge/kakaotalk-FFCD00?style=for-the-badge&logo=kakaotalk&logoColor=black">

# 팀원소개
<table>
  <tbody>
    <th><img src="" width="100px;" alt=""/></th>
    <th><img src="https://avatars.githubusercontent.com/u/42923256?s=400&u=c92bb3ee8e217b7f503eb42ca7297e18d6f67415&v=4" width="100px;" alt=""/></th>
    <th><img src="" width="100px; height="100px;" alt=""/></th>
    <th><img src="" width="100px;" alt=""/></th>
    <th><img src="" width="100px;" alt=""/></th>
    <tr>
      <td align="center"><a href=""><b>팀장 : </b>김동준</a><br /></td>
      <td align="center"><a href="https://github.com/ssee103"><b>팀원 : </b>백승권</a><br /></td>
      <td align="center"><a href=""><b>팀원 : </b>김원빈</a><br /></td>
      <td align="center"><a href=""><b>팀원 : </b>정예림</a><br /></td>
      <td align="center"><a href=""><b>팀원 : </b>한유림</a><br /></td>
     <tr/>
  </tbody>
</table>

# **협업방식**
- 회의
  - 개발 전 산출물 기간 매주 1~2회 회의 (3시간 이상)
 
  
- **REDMINE**
  - 매일 일일 업무일지 작성
  - Gantt Chart 관리
 
  
- **Notion**
  - 회의록 기록하여 보관
  - 컨벤션, 트러블 슈팅, 개발 산출물 관리

# 프로젝트 산출물
- **요구사항 정의서**<br/>
https://www.notion.so/1a430ec5a5b480fa97b0d488cf76426e?pvs=4


- **ERD**<br/>
https://www.notion.so/ERD-1a430ec5a5b4805faee6f2dba7fcb3bb?pvs=4

- **FIGMA 화면정의**<br/>
https://www.figma.com/design/aptpPcRIWCamw4bXrgjQMP/Figma-basics?node-id=1669-162202&t=2bCPZEVlgSYT7i1S-1


# 프로젝트 결과물
- 착수 발표
- 최종 발표

# 화면 구성


## 로그인 페이지
- 사번과 비밀번호를 이용하여 로그인


![image](https://github.com/user-attachments/assets/8c0f453b-4df2-4edb-997a-21f50bbbfe86)

## 메인 페이지
- 각종 기록 확인


![image](https://github.com/user-attachments/assets/6fde0b61-d444-4c08-9e5e-369f6a4d88da)

## 출·퇴근 상세 페이지
- 출·퇴근 등록 기능
- 각종 근태 관련 기록 확인 
- 출·퇴근 목록


![image](https://github.com/user-attachments/assets/39b67cbe-4613-4395-89a7-7322e845b8f7)

## 기안 문서 페이지(전자 결재)
- 결재 라인 지정, 참조자 지정
- 기안 문서 미리보기
- 기안 문서 목록

![image](https://github.com/user-attachments/assets/37fbe27d-707c-4bd8-9f09-43d1adb5b076)
![image](https://github.com/user-attachments/assets/7310144a-9014-4767-b376-bbbc3911b7a6)
![image](https://github.com/user-attachments/assets/b7d96a6e-c77b-477a-b943-dbb03b8ca811)

## 결재 문서 페이지 
- 승인 및 반려 기능

  
![image](https://github.com/user-attachments/assets/fd66159a-f3ed-4621-8762-38b3f47b11f9)

## 부서별 정보 조회 페이지
- 사내 모든 부서 조회 가능


![image](https://github.com/user-attachments/assets/53d14bb2-cb91-4064-b3ea-5dded5db8af5)

## 사내 쪽지함 페이지
- 받은 쪽지, 보낸 쪽지
- 휴지통으로 이동, 복원
- 쪽지 보내기

![image](https://github.com/user-attachments/assets/b0321367-00eb-4926-9a84-138c21e0252b)
![image](https://github.com/user-attachments/assets/9156a25a-ac4a-4260-98ba-a1dec0e49df6)
![image](https://github.com/user-attachments/assets/f77767b0-1a0c-4b8a-8bc9-55b95389ba29)
![image](https://github.com/user-attachments/assets/fc1930c3-ee9a-43db-8246-699d2fa7a9e5)

## 채팅
- 채팅방 초대 기능
- 방 나가기 기능
- 안 읽은 메시지 수 기능


![image](https://github.com/user-attachments/assets/c150d376-3d18-4189-b1be-7e18858f8744)
![image](https://github.com/user-attachments/assets/87eb2a62-75ab-47c1-ad28-547b55b7c473)
![image](https://github.com/user-attachments/assets/988cb90f-e2fa-4f1e-aa7c-180b21866b1c)
![image](https://github.com/user-attachments/assets/a8340bd8-6bdf-43f4-b133-9a9d93cbbedb)
![image](https://github.com/user-attachments/assets/4454332e-7ede-4c73-9766-0a6f6fdc70ea)

## 급여(일반사원 화면)
- 나의 급여 목록
- 급여 명세서 상세보기
- 급여 명세서 다운로드


![image](https://github.com/user-attachments/assets/5881cba5-5da3-4a57-9e49-818159d9f476)
![image](https://github.com/user-attachments/assets/53e653a1-35bb-44f2-b8a3-80d491bcee69)
![image](https://github.com/user-attachments/assets/77047b31-6cd3-4d4c-9934-2de1b19d277a)

## 급여(관리자 화면)
- 개별 지급
- 일괄 지급
- 급여 명세서 다운로드


![image](https://github.com/user-attachments/assets/3c853e50-00c3-46be-98cd-47ec9e9c7ff9)
![image](https://github.com/user-attachments/assets/3f5ec1e5-d5d0-46b3-8fc2-45cd608bb0ee)
![image](https://github.com/user-attachments/assets/eb5035aa-c563-4928-9c8f-75aa7c39c996)
![image](https://github.com/user-attachments/assets/db1945bd-5338-4418-b8d2-2ddbcef80d39)

## 채용(관리자 화면)
- 채용 공고 작성
- 지원자 목록
- 입사지원서 보기/평가
- 채용 확정 시 메일 전송
- 엑셀 다운로드

![image](https://github.com/user-attachments/assets/ddb50634-cc8b-4eba-8ddc-5f211843b9d7)
![image](https://github.com/user-attachments/assets/0b768039-b73a-4c2f-bb3b-7cfb67450563)
![image](https://github.com/user-attachments/assets/5b01c1e4-a869-4618-82bd-fc6c05ffe1cb)
![image](https://github.com/user-attachments/assets/b413b6b9-c423-4da1-a74e-78776bb473d5)
![스크린샷(560)](https://github.com/user-attachments/assets/1d068e6c-30df-4539-a3f2-feaea3496b25)
![스크린샷(483)](https://github.com/user-attachments/assets/5327d7e6-34d4-484b-9504-0cf3b2c7ff73)

## 입사 지원 (리액트로 구성한 회사 홈페이지)
- 입사 지원

![HRMS-Chrome2025-02-2511-36-341-ezgif com-speed](https://github.com/user-attachments/assets/15abd29c-347a-446d-9cd9-a67082266f97)




