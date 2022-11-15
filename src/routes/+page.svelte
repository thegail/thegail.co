<script>
	import Banner from "$lib/Banner.svelte";
	import Footer from "$lib/Footer.svelte";
	import { fade } from "svelte/transition";
    import { page } from "$app/stores";
	import { onMount } from "svelte";

    let showFooter = false;
    let fadeStage = 0;

    function tagValue(path) {
        return $page.url.pathname === path ? "span" : "a";
    }

    // Currying! Reactivity! This is definitely not idiomatic but
    // it works so I do not care.
    $: getOpacity = ((fadeStage) => (i) => fadeStage < i ? "0%" : "100%")(fadeStage);

    function checkMousePosition() {}

    onMount(() => {
        let int = setInterval(() => {
            fadeStage += 1;
            if (fadeStage >= 7) clearInterval(int);
        }, 200);
    });
</script>

<main>
    <div class="spacer" />
    <Banner />

    <nav>
        <svelte:element this={tagValue("/")} href="/" style:opacity={getOpacity(1)}>1234</svelte:element> <span style:opacity={getOpacity(2)}>/</span>
        <svelte:element this={tagValue("/about")} href="/about" style:opacity={getOpacity(3)}>5678</svelte:element> <span style:opacity={getOpacity(4)}>/</span>
        <svelte:element this={tagValue("/code")} href="/code" style:opacity={getOpacity(5)}>90123</svelte:element> <span style:opacity={getOpacity(6)}>/</span>
        <svelte:element this={tagValue("/contacts")} href="/contacts" style:opacity={getOpacity(7)}>45678</svelte:element>
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
        transition: opacity 0.8s;
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
