<script>
    import { onMount } from "svelte";
    import { page } from "$app/stores";
    import staticData from "$lib/staticdata.json";
	import Banner from "$lib/Banner.svelte";

    let isDarkMode = false;
    onMount(() => {
        isDarkMode = window.matchMedia("(prefers-color-scheme: dark)").matches;
        console.log(isDarkMode);
    });

    function tagValue(path) {
        return $page.url.pathname === path ? "span" : "a";
    }
</script>

<header>
    <Banner />
    <nav>
        <svelte:element this={tagValue("/")} href="/">home</svelte:element> /
        <svelte:element this={tagValue("/about")} href="/about">about</svelte:element> /
        <svelte:element this={tagValue("/code")} href="/code">code</svelte:element> /
        <svelte:element this={tagValue("/contacts")} href="/contacts">contacts</svelte:element>
    </nav>
</header>
<main>
    <div class="innermain">
        <slot />
    </div>
</main>
<footer>
    <span>
        &copy; thegail 2022 /
        &#x1F3F7; <code>{staticData.commitHash}</code> /
        &#x1F528; {staticData.buildDate} /
        &#x1F9F1; with <a href="https://kit.svelte.dev" target="_blank">SvelteKit</a>
    </span>
</footer>

<style>
    header {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    nav {
        display: flex;
        justify-content: center;
        width: 100%;
        gap: 5px;
        padding-top: 5px;
        padding-bottom: 5px;
        margin: 0;
        border-top: 2px solid var(--secondary);
        border-bottom: 2px solid var(--secondary);
    }

    main {
        flex-grow: 100;
        overflow: scroll;
    }

    .innermain {
        padding-left: 20%;
        padding-right: 20%;
    }

    footer {
        display: flex;
        justify-content: center;
        border-top: 2px solid var(--secondary);
    }
</style>