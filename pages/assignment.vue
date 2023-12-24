<template>
  <div>
    <FixedExtension
        :extensions="fixedExtensions"
    />
    <CustomExtensionInput
        :extensions="customExtensions"
        @removeCustomExtensions="removeCustomExtensions"
        @addCustomExtensions="addCustomExtensions"
    />
  </div>
</template>
<script setup>

import {onMounted} from "vue";

const fixedExtensions = ref([]);
const customExtensions = ref([]);

const toast = useToast()
const { data } = await useAsyncData('homeData', () => $fetch('http://localhost:8080/home'));

onMounted(async () => {
  try {
    fixedExtensions.value = data.value.data.fixedExtResponse;
    customExtensions.value = data.value.data.customExtResponse;
  } catch (err) {
    toast.add({
      title: "Error",
      color: 'red',
      description: "Error while fetching fixed extensions",
      timeout: 2000,
    })
  }
})

const addCustomExtensions = (extension) => {
  console.log(customExtensions.value.push(extension));
}

const removeCustomExtensions = (index) => {
  customExtensions.value.splice(index, 1)
}
</script>
<style scoped>

</style>