<script>
    import { onMount } from "svelte";
    import { page } from "$app/stores";
    import staticData from "$lib/staticdata.json";
    import faviconLight from "$lib/assets/favicon.svg";
    import faviconDark from "$lib/assets/favicon_dark.svg";
    import bannerLight from "$lib/assets/fullsize_transparent.png";
    import bannerDark from "$lib/assets/fullsize_transparent_dark.png";

    let isDarkMode = false;
    $: favicon = isDarkMode ? faviconDark : faviconLight;
    onMount(() => {
        isDarkMode = window.matchMedia("(prefers-color-scheme: dark)").matches;
        console.log(isDarkMode);
    });

    function tagValue(path) {
        return $page.url.pathname === path ? "span" : "a";
    }
</script>

<svelte:head>
    <title>thegail</title>
    <link rel="apple-touch-icon" href={favicon} />
    <link rel="icon" type="image/png" href={favicon} />
    <link rel="mask-icon" href={favicon} color="#202020" />
    <link rel="shortcut icon" href={favicon} />
    <meta name="theme-color" content={isDarkMode ? "#202020" : "#D0D0D0"} />
</svelte:head>

<header>
    <!-- <img class="banner" src={isDarkMode ? bannerDark : bannerLight} alt="thegail" /> -->
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

    .banner {
        max-width: 100%;
        max-height: 150px;
        width: auto;
        height: auto;
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

    :global(*) {
        color: var(--secondary);
        font-family: Lato, Helvetica, sans-serif;
    }

    :global(body) {
        background: var(--primary);
        padding-left: 20px;
        padding-right: 20px;
        display: flex;
        flex-direction: column;
        width: calc(100% - 40px);
        height: 100%;
        margin: 0;
        overflow: hidden;
    }

    :global(html) {
        width: 100%;
        height: 100%;
    }

    :global(ul) {
        list-style-type: ">   ";
    }

    :global(code) {
        font-family: Menlo, monospace;
        font-size: 0.9em;
    }

    @media(prefers-color-scheme: light) {
        :global(:root) {
            --primary: #D0D0D0;
            --secondary: #202020;
        }
    }

    @media(prefers-color-scheme: dark) {
        :global(:root) {
            --primary: #202020;
            --secondary: #D0D0D0;
        }
    }
</style>