<template>
  <div>
    <div class="mainpage">
      <h1>header</h1>
      <news :sexytext=" 'сочная при сочная'"></news>
      <news></news>
      <news :sexytext="'я не сочная'"></news>
      <news></news>
      <news2></news2>
      <news2 :sexytext="'Роман и Виктория написали этот sexy код =)'"></news2>
      
    </div>
  </div>
</template>

<script>
  export default {
    name: 'Mainpage',
    components: {
      News: () => import('~/components/News'),
      News2: () => import('~/components/News2'),
    },

    data() {
      return {}
    },
  };
</script>

<style scoped>
  .container {
    display: grid;
    background-color: #f3f3f3;
    padding: 2rem 4rem;
  }
  .text {
    font-family: sans-serif;
    font-size: 2rem;
  }
</style>
