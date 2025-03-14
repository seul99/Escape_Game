# 🎮 Lua 를 이용하여 미니게임 만들기
동덕여자대학교 게임개발 동아리 NPC에서 진행한 해커톤에 참여하여 미니게임 제작 🕹️ <br>
2025.02.20 ~ 2025.02.27 진행 <br>
처음 사용해보는 언어인 **lua** 를 1~2일간 학습하고 게임개발 후 구글플레이 출시 <br>
<br>

## 🎈 게임 시작 화면
![image](https://github.com/user-attachments/assets/b5e18a65-7457-4ff5-9aa2-65a341dec3db)

<br><br>

## 📝 게임 소개
![솜뭉치-0000](https://github.com/user-attachments/assets/47150bae-e162-4833-95f7-98160a9174ad)
<!-- ![솜뭉치-0001](https://github.com/user-attachments/assets/71da40ab-2e11-4df4-84e5-a90ff589dbda) -->
![솜뭉치-0002](https://github.com/user-attachments/assets/a5231b26-b6cf-4c44-8fa9-5d87efeb8f40)
![솜뭉치-0003](https://github.com/user-attachments/assets/1e7c2099-13b7-4d7f-aa50-a0279118e17e)
![솜뭉치-0004](https://github.com/user-attachments/assets/b2925c41-fb98-4732-b102-a9a126bcdc50)
![솜뭉치-0005](https://github.com/user-attachments/assets/31e50e6d-d002-4dc8-b11d-99cf373d2c8b)
<!-- ![솜뭉치-0006](https://github.com/user-attachments/assets/1d8f0065-8a92-4135-bf6e-165f3c81bc5e) -->
<!-- ![솜뭉치-0007](https://github.com/user-attachments/assets/8dc9465d-5af9-4e1e-9df2-ecffba8a93a6) -->


<br>

## 👥 팀원
![솜뭉치-0006](https://github.com/user-attachments/assets/1d8f0065-8a92-4135-bf6e-165f3c81bc5e)

<br><br>

## 👩🏻‍💻 담당 
- 미니게임 중 안방
- 각 게임마다 실패, 완료 시 화면 구현
- 게임 선택창에서 게임화면 이동 후 다시 복귀
- 게임의 실행, 실패, 성공 카운트를 하여 적절한 엔딩씬 으로 화면 전환

<br>

## ⚙️ 주요 기능 
- (미니게임) 흐트러진 이미지를 클릭 또는 드래그하여 위치를 맞춘다.
- (각 게임에서) 10초 이내에 이미지를 맞추면 'completed' 페이지로 넘어가 총알을 획득한다.
- 실패할 경우 game_wrong 페이지로 넘어가 실패 횟수에 따라 대사, 엔딩이 달라지고 다시 게임 선택지로 돌아간다.
- 게임 선택지에서 총알이 획득한 갯수를 표시하고 3개를 다 모으면 ending_Happy, 1개라도 못모으면 다른 엔딩으로 변경된다.

<br><br>

## 🎬 게임 플레이 보러가기
<a href="https://www.youtube.com/watch?v=qcGjpbePZVU">
  <img src="https://img.youtube.com/vi/qcGjpbePZVU/0.jpg" width="300">
</a>

<!--
처음으로 깃을 통해 협업을 진행해서 어려운점이 많았다.
개발자는 4명이었는데 모두 깃을 많이 사용해본 경험이 적었고, 특히 혼자 저장용도로만 사용해봐서 깃을 통한 협업이 어려웠다.
특히 각자의 브랜치를 만들어서 코드를 업로드하고, main 브랜치로 merge 하는 작업이 매우 힘들었다.
개발파트를 맡은 사람들이 깃을 통한 협업에 익숙해지기 위해 6시간 이상 회의를 하면서 서로 화면을 공유하며 도왔다. 
그렇게 점점 깃 사용이 익숙해지고 실력이 늘어갔다.

lua 라는 언어를 처음 접해보고, 하루만 공부를 하여
단기간 내에 게임의 모든 씬을 만들고 연결하고 
실패 횟수에 따라 게임 엔딩을 다르게 하는 등 복잡한 로직을 구현하기는 쉽지 않았다.
모두가 제출 전날부터 밤을 새며 일박 이일동안 게임을 구현하였고
제출당일 오전부터 카페에서 모여 서로 코드를 리뷰해주며 게임을 완성해 나갔다.

기획과 디자이너와의 소통이 제대로 이루어 지지않아 배경 화면이 부족했고
기획은 우리의 실력을 고려하지 않고 너무 많은 화면을 구현하여 어려움이 있었다.
그래서 개발자들끼리 협의를 한 후 할 수 있는 곳 까지 다 구현하고 못한부분은 기획에게 말하기로 했다.
결국 모든 화면을 구현하고 엔딩 로직도 구현하였지만 브금까지는 추가하지 못했고 
비록 브금은 추가하지 못했지만 하나의 완성된 게임을 만들 수 있었다.

구글 플레이 출시를 목표로 1260*720 사이즈로 게임을 제작 하였다.

-->
