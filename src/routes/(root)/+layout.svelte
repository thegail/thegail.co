<script>
    import staticData from "$lib/staticdata.json";
	import Banner from "$lib/Banner.svelte";
	import Navigation from "$lib/Navigation.svelte";
</script>

<header>
    <Banner />
    <Navigation />
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