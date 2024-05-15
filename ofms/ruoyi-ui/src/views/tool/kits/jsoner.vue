<template>
  <JsonEditor
    :options="{
            confirmText: 'confirm',
            cancelText: 'cancel',
        }"
    :objData="jsonData"
    v-model="jsonData" >
  </JsonEditor>
</template>

<script>
export default {
  name: 'jsoner',
  data: function() {
    return {
      jsonData: {
        name: 'mike',
        age: 23,
        phone: '18552129932',
        address: ['AAA C1', 'BBB C2']
      }
    }
  }
}
</script>

<style scoped>

</style>
