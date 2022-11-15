<script>
    import bannerLight from "$lib/assets/fullsize_transparent.png";
    import bannerDark from "$lib/assets/fullsize_transparent_dark.png";
    import { onMount } from "svelte";

    export let maxHeight = "150px";
    export let maxWidth = "100%";

    let isDarkMode = false;
    onMount(() => {
        isDarkMode = window.matchMedia("(prefers-color-scheme: dark)").matches;
        console.log(isDarkMode);
    });
</script>

<img class="banner" style:max-height={maxHeight} style:max-width={maxWidth} src={isDarkMode ? bannerDark : bannerLight} alt="thegail" />

<style>
    .banner {
        width: auto;
        height: auto;
    }
</style>