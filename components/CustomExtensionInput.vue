<template>
  <v-row>
    <v-col cols="12">
      <v-row align="center">
        <v-col cols="2" class="text-center mb-3">컴스텀 확장자</v-col>
        <v-col cols="5">
          <v-text-field
              v-model="input"
              label="확장자 입력"
              variant="solo"
          />
        </v-col>
        <v-col cols="3">
          <v-btn
              @click="createCustomExtension()"
              color="primary"
              text="+추가"
          />
        </v-col>
      </v-row>
    </v-col>
  </v-row>

  <v-row>
    <v-col cols="2"/>
    <v-col cols="8" class="outline-row">
      <v-col cols="12" class="text-left">
        {{ extensions.length }} / 200
      </v-col>
      <v-col cols="12">
          <v-chip
              class="ma-1"
              v-for="(ext, index) in extensions"
              :key="index"
          >
            {{ ext.extension }}
            <v-icon @click="removeExtension(ext, index)">mdi-delete</v-icon>
          </v-chip>
      </v-col>
    </v-col>
  </v-row>
</template>
<script setup>
const input = ref('')
const toast = useToast()
const config = useRuntimeConfig();

const props = defineProps({
  extensions: {
    type: Array,
    required: true
  },
})

const emit = defineEmits(['addCustomExtensions', 'removeCustomExtensions'])

const createCustomExtension = async () => {

    const { data: response, error } = await useAsyncData('homeData', () => $fetch('http://localhost:8080/extensions/custom', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        input: input.value
      })
    }));
    input.value = '';

    if (error._object.homeData) {
      const errorMsg = error._object.homeData.data.data;
      toast.add({
        title: "Error",
        color: 'red',
        description: errorMsg,
        timeout: 2000,
      })

      return;
    } else {
      const resp = response.value.data;
      const extension = {
        "id": resp.id,
        "extension": resp.extension
      }

      emit('addCustomExtensions', extension);
    }
}
const removeExtension = async (ext, index) => {

  const { data, error } = await useAsyncData('removeExtension', () => $fetch(config.public.api + '/extensions/custom/' + ext.id, {
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json'
    },
  }));

  if (data.value) {
    toast.add({
      title: "Success",
      color: 'green',
      description: "삭제되었습니다.",
      timeout: 2000,
    })
    emit('removeCustomExtensions', index);
  } else {
    console.log(error);
    toast.add({
      title: "Error",
      color: 'red',
      description: "삭제에 실패하였습니다.",
      timeout: 2000,
    })

  }

}

</script>
<style scoped>
.outline-row {
  border: 1px solid #000;
  padding: 10px;
}
</style>