<script>
	import Banner from "$lib/Banner.svelte";
	import Navigation from "$lib/Navigation.svelte";
	import Footer from "$lib/Footer.svelte";
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

<Footer />

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
</style>