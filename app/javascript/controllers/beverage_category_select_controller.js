import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["category", "subCategory"]

  async updateSubcategories({params: {url}}) {
    const category = this.categoryTarget.value
    const subcategory = this.subCategoryTarget
    subcategory.innerHTML = '<option value="">Select specific beverage</option>'
    if (category) {
      const response = await fetch(`${url}?beverage_category_id=${category}`)
      const data = await response.json()
      data.forEach(item  => {
        const option = document.createElement("option")
        option.value = item.id
        option.textContent = item.name
        subcategory.appendChild(option)
      })
    }
  }
}
