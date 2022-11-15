<script>
	import Banner from "$lib/Banner.svelte";
	import Navigation from "$lib/Navigation.svelte";
	import Footer from "$lib/Footer.svelte";
	import { fade } from "svelte/transition";

    let showFooter = false;
</script>

<main>
    <div class="spacer" />
    <Banner />
    <Navigation large={true} />
    <div class="spacer" />

    {#if showFooter}
        <Footer sliding=true />
        <div class="hoverdetector" on:mouseleave={() => showFooter = false}>&nbsp;</div>
    {:else}
        <span class="dot" on:mouseenter={() => showFooter = true} in:fade={{ duration: 200 }} />
    {/if}
</main>

<style>
    main {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .spacer {
        flex-grow: 1;
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
        left: 0;
        width: calc(100% + 40px);
    }
</style>
