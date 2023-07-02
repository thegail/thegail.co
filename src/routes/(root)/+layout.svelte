<script>
	import Banner from "$lib/Banner.svelte";
	import Footer from "$lib/Footer.svelte";
    import { page } from "$app/stores";

    $: tagValue = ((currentPath) => (path) => currentPath === path ? "span" : "a")($page.url.pathname);
</script>

<header>
    <Banner />
    <nav data-sveltekit-prefetch>
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

<Footer />

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
</style>