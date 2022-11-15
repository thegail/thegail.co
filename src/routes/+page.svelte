<script>
	import Banner from "$lib/Banner.svelte";
	import Navigation from "$lib/Navigation.svelte";
</script>

<main>
    <Banner />
    <Navigation large={true} />
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
</style>
