function adicionarItem(){
    const input = document.getElementById("itemInput");
    if(!input.value || input.value.trim() === ""){
        return 
    }

    const texto = input.value.trim();

    const li = document.createElement("li");
    li.textContent = texto;
    const btnRemove = document.createElement("button");
    btnRemove.addEventListener("click", () => {
        li.remove();
    })
    btnRemove.textContent = "Remover";
    btnRemove.classList.add("remove-btn")
    li.appendChild(btnRemove);
    const ul = document.getElementById("listaTarefas")
    ul.appendChild(li);

    //Para limpar onde digita
    input.value = "";
    input.focus();
}

const input = document.getElementById("itemInput");
input.addEventListener("keydown", (event) =>{
    if(event.key === "Enter"){
        adicionarItem();
    }
})