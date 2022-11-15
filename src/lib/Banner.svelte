<script>
    import bannerLight from "$lib/assets/fullsize_transparent.png";
    import bannerDark from "$lib/assets/fullsize_transparent_dark.png";
    import { onMount } from "svelte";

    export let maxHeight = 150;

    let isDarkMode = false;
    onMount(() => {
        isDarkMode = window.matchMedia("(prefers-color-scheme: dark)").matches;
        console.log(isDarkMode);
    });
</script>

<img class="banner" style:max-height="{maxHeight}px" src={isDarkMode ? bannerDark : bannerLight} alt="thegail" />

<style>
    .banner {
        max-width: 100%;
        width: auto;
        height: auto;
    }
</style>