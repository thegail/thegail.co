<script>
    import { onMount } from "svelte";
    import { page } from "$app/stores";

    let isDarkMode = false;
    $: darkText = isDarkMode ? "_dark" : "";
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
    <link rel="apple-touch-icon" href="%sveltekit.assets%/favicon{darkText}.svg" />
    <link rel="icon" type="image/png" href="%sveltekit.assets%/favicon{darkText}.svg" />
    <link rel="mask-icon" href="%sveltekit.assets%/favicon{darkText}.svg" color="#202020" />
    <link rel="shortcut icon" href="%sveltekit.assets%/favicon{darkText}.svg" />
    <meta name="theme-color" content={isDarkMode ? "#202020" : "#D0D0D0"} />
</svelte:head>

<header>
    <img class="banner" src="/fullsize_transparent{darkText}.png" alt="thegail" />
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
    hi :) / &copy; 2022 thegail / &#x1F3F7; dev
</footer>

<style>
    header {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .banner {
        height: 150px;
        width: auto;
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