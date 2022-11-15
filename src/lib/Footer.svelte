<script>
    import staticData from "$lib/staticdata.json";
    import { slide } from "svelte/transition";

    export let sliding = false;
</script>

<footer transition:slide={{ duration: sliding ? 400 : 0 }}>
    <span>
        &copy; thegail 2022 /
        &#x1F3F7; <code>{staticData.commitHash}</code> /
        &#x1F528; {staticData.buildDate} /
        &#x1F9F1; with <a href="https://kit.svelte.dev" target="_blank">SvelteKit</a>
    </span>
</footer>

<style>
    footer {
        width: 100%;
        display: flex;
        justify-content: center;
        border-top: 2px solid var(--secondary);
    }
</style>