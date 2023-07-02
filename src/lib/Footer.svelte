<script>
    import staticData from "$lib/staticdata.json";
    import { slide } from "svelte/transition";

    export let sliding = false;

    let shown = false;
    $: visible = (!sliding) || shown;
    const repoLink = "https://github.com/thegail/thegail.co";
</script>

{#if visible}
    <footer 
        transition:slide={{ duration: sliding ? 400 : 0 }}
        on:mouseleave={() => shown = false}
        on:mouseenter={() => shown = true}
    >
        <span>
            &copy; thegail 2023 /
            &#x1F3F7; <a href={repoLink} target="_blank"><code>{staticData.commitHash}</code></a> /
            &#x1F528; {staticData.buildDate} /
            &#x1F9F1; with <a href="https://kit.svelte.dev" target="_blank">SvelteKit</a>
        </span>
    </footer>
    <div
        class="hoverdetector"
        on:mouseenter={() => shown = true}
        on:mouseleave={() => shown = false}
    >
        &nbsp;
    </div>
{:else}
    <span class="dot" on:mouseenter={() => shown = true} />
{/if}

<style>
    footer {
        width: 100%;
        display: flex;
        justify-content: center;
        border-top: 2px solid var(--secondary);
    }

    .dot {
        border-radius: 50%;
        background: var(--secondary);
        border: none;
        height: 10px;
        width: 10px;
        padding: 0;
        position: absolute;
        right: 5px;
        bottom: 5px;
    }

    .hoverdetector {
        position: absolute;
        bottom: 0;
        right: 0;
        width: 40px;
        z-index: 0;
    }
</style>