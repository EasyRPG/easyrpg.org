/*
 * Adds background snowflakes for the winter months
 */
$(document).ready(function() {
    $('body').click(function() {
        try {
            $('body').flurry('destroy');
        }
        catch(err) {
            $('body').flurry({
                character: "❄❅❆*",
                color: ["white", "lightgray", "floralwhite", "ghostwhite", "aliceblue", "azure"],
                height: 300,
                frequency: 200,
                speed: 6000,
                large: 36,
                rotation: 0,
                rotationVariance: 90
            });
        }
    });
    $('body').click();
});
