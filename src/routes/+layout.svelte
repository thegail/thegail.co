<script>
    import faviconLight from "$lib/assets/favicon.svg";
    import faviconDark from "$lib/assets/favicon_dark.svg";
	import { onMount } from "svelte";

    let isDarkMode = false;
    onMount(() => {
        isDarkMode = window.matchMedia("(prefers-color-scheme: dark)").matches;
    });

    $: favicon = isDarkMode ? faviconDark : faviconLight;
</script>

<svelte:head>
    <title>thegail</title>
    <link rel="apple-touch-icon" href={favicon} />
    <link rel="icon" type="image/png" href={favicon} />
    <link rel="mask-icon" href={favicon} color="#202020" />
    <link rel="shortcut icon" href={favicon} />
    <meta name="theme-color" content={isDarkMode ? "#202020" : "#D0D0D0"} />
</svelte:head>

<slot />

<style>
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