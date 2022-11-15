<script>
    import bannerLight from "$lib/assets/fullsize_transparent.png";
    import bannerDark from "$lib/assets/fullsize_transparent_dark.png";
    import { onMount } from "svelte";

    let isDarkMode = false;
    onMount(() => {
        isDarkMode = window.matchMedia("(prefers-color-scheme: dark)").matches;
    });
</script>

<img class="banner" src={isDarkMode ? bannerDark : bannerLight} alt="thegail" />

<style>
    .banner {
        max-width: 100%;
        max-height: 150px;
        width: auto;
        height: auto;
    }
</style>