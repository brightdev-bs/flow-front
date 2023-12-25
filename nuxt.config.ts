// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    runtimeConfig: {
        public: {
            api: process.env.SERVER
        },
    },

    devtools: { enabled: true },
    modules: [
        '@nuxt/ui',
        '@invictus.codes/nuxt-vuetify'
    ],

})
