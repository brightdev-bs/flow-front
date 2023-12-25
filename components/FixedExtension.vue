<template>
  <v-row>
    <v-col cols="12">
      <v-row align="center">
        <v-col cols="2" class="text-center mb-5">고정 확장자</v-col>
        <v-col cols="10">
          <v-row>
            <v-col cols="auto" v-for="ext in extensions" :key="ext.id">
              <v-checkbox
                  v-model="ext.active"
                  @click="update(ext)"
                  :label="`${ext.extension}`"
              />
            </v-col>
          </v-row>
        </v-col>
      </v-row>
    </v-col>
  </v-row>
</template>
<script setup>
import {useAsyncData} from "nuxt/app";
const toast = useToast()

defineProps({
  extensions: {
    type: Array,
    required: true
  }
})
const update = async (ext) => {
  if (ext.active === false) {
    ext.active = true;
  } else {
    ext.active = false;
  }

  try {
    await useAsyncData('updateExtension', () => $fetch(process.env.SERVER + '/extensions/fixed/' + ext.id, {
      method: 'patch',
      headers: {
        'Content-Type': 'application/json'
      },
      body: { flag: ext.active },
    }));
    toast.add({
      title: "Success",
      id: "1",
      color: 'green',
      description: "Fixed extensions updated",
      timeout: 2000,
    });
  } catch (error) {
    toast.add({
      title: "Error",
      color: 'red',
      description: "Error while updating fixed extensions",
      timeout: 2000,
    })
  }
}


</script>
<style scoped>
</style>