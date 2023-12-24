<template>
  <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
    <v-row justify="center" align="center">
      <v-col>
        <!-- 중앙에 위치한 컨텐츠 컨테이너 -->
        <div class="center-div" style="text-align: center; font-size: 20px; font-weight: bold;">
          문제를 해결하는 개발자 김병수입니다.
        </div>
        <!-- 네비게이션 링크 -->
        <div style="text-align: center; margin-top: 20px;">
          <NuxtLink to="/assignment" style="text-decoration: none; color: blue; font-size: 18px;">
            과제로 이동
          </NuxtLink>
        </div>
      </v-col>
    </v-row>
</div>
</template>
