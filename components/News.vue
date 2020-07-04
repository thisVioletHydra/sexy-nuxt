<template>
  <div>
    <div class="container">
      <h2>vika puska</h2>
      <p class="text">{{ sexytext }}</p>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'News',
    components: {},

    props: {
     
      sexytext: {
        type: String,
        default: 'самая сочная ягодка',
      },
      
    },

    data() {
      return {};
    },
  };
</script>

<style scoped>
  .text {
    font-family: sans-serif;
    font-size: 2rem;
  }
</style>
