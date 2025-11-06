-- Shortcode Quarto : icône copier avec infobulle et retour visuel "Copié !"
function copytext(args)
  return pandoc.RawBlock("html", [[
<script>
  function copyToClipboard(text) {
    navigator.clipboard.writeText(text)
      .catch((error) => {
        console.error("Erreur lors de la copie :", error);
      });
  }

  document.addEventListener("DOMContentLoaded", function() {
    const copyElements = document.querySelectorAll("[data-copy-text]");

    copyElements.forEach((element) => {
      // Style du mot parent (optionnel)
      element.style.cursor = "default";
      element.style.fontWeight = "bold";
      element.style.color = "black";
      element.style.textDecoration = "none";

      // Créer l'icône copier
      const icon = document.createElement("span");
      icon.innerHTML = "📝";                   // Icône seule
      icon.style.cursor = "pointer";
      icon.style.marginLeft = "4px";
      icon.style.verticalAlign = "super";
      icon.style.fontSize = "0.8em";
      icon.setAttribute("title", "Copier l'URI dans le presse-papier"); // infobulle

      // Ajouter l'icône après le mot
      element.appendChild(icon);

      // Clic sur l'icône : copie + feedback "Copié !"
      icon.addEventListener("click", function(event) {
        event.stopPropagation(); // éviter propagation
        const textToCopy = element.getAttribute("data-copy-text");
        copyToClipboard(textToCopy);

        // Sauvegarder l’icône actuelle
        const original = icon.innerHTML;

        // Changer temporairement l’icône en "✅"
        icon.innerHTML = "✅";

        // Revenir à l’icône après 1,5 seconde
        setTimeout(() => { icon.innerHTML = original; }, 1500);
      });
    });
  });
</script>
  ]])
end
