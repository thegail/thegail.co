<script>
	import Banner from "$lib/Banner.svelte";
	import Footer from "$lib/Footer.svelte";
	import { fade } from "svelte/transition";
    import { page } from "$app/stores";

    let showFooter = false;

    function tagValue(path) {
        return $page.url.pathname === path ? "span" : "a";
    }

    function checkMousePosition() {}
</script>

<main>
    <div class="spacer" />
    <Banner />

    <nav>
        <svelte:element this={tagValue("/")} href="/">home</svelte:element> <span>/</span>
        <svelte:element this={tagValue("/about")} href="/about">about</svelte:element> <span>/</span>
        <svelte:element this={tagValue("/code")} href="/code">code</svelte:element> <span>/</span>
        <svelte:element this={tagValue("/contacts")} href="/contacts">contacts</svelte:element>
    </nav>
    <div class="spacer" />

    {#if showFooter}
        <Footer sliding=true />
        <div class="hoverdetector" on:mouseleave={() => checkMousePosition}>&nbsp;</div>
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

    nav {
        display: flex;
        justify-content: center;
        width: 100%;
        gap: 5px;
        padding-top: 5px;
        padding-bottom: 5px;
        margin: 0;
        font-size: min(1.6em, 6vw);
    }

    nav * {
        /* opacity: 0; */
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
        z-index: 0;
    }

    :global(footer) {
        z-index: 1;
    }
</style>
