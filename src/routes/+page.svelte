<script>
	import Banner from "$lib/Banner.svelte";
	import Footer from "$lib/Footer.svelte";
    import { page } from "$app/stores";
	import { onMount } from "svelte";

    let fadeStage = 0;

    function tagValue(path) {
        return $page.url.pathname === path ? "span" : "a";
    }

    // Currying! Reactivity! This is definitely not idiomatic but
    // it works so I do not care.
    $: getOpacity = ((fadeStage) => (i) => fadeStage < i ? "0%" : "100%")(fadeStage);

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
        <svelte:element this={tagValue("/")} href="/" style:opacity={getOpacity(1)}>home</svelte:element>
        <span style:opacity={getOpacity(2)}>/</span>
        <svelte:element this={tagValue("/about")} href="/about" style:opacity={getOpacity(3)}>about</svelte:element>
        <span style:opacity={getOpacity(4)}>/</span>
        <svelte:element this={tagValue("/code")} href="/code" style:opacity={getOpacity(5)}>code</svelte:element>
        <span style:opacity={getOpacity(6)}>/</span>
        <svelte:element this={tagValue("/contacts")} href="/contacts" style:opacity={getOpacity(7)}>contacts</svelte:element>
    </nav>
    <div class="spacer" />

    <Footer sliding={true} />
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
        transition: opacity 0.9s;
    }
</style>
