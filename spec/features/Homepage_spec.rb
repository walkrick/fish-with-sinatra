require "spec_helper"

feature "Homepage" do
  scenario "should have a greeting" do
    visit "/"

    expect(page).to have_content("Fish Homepage")

  end

  scenario "should have a list of fish" do
    visit "/"

    expect(page).to have_content("trout", "catfish", "beta")
  end

  scenario "should have a catfish" do
    visit "/fish/1"

    expect(page).to have_content("catfish")
    expect(page).to have_link("Wikipedia Link", options = {href: "http://en.wikipedia.org/wiki/Catfish"})
    expect(page).to have_link("HOMEPAGE", options = {href: "/"})
    expect(page).to have_css("img[src='http://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Ameiurus_melas_by_Duane_Raver.png/240px-Ameiurus_melas_by_Duane_Raver.png']")
  end

  scenario "should have a trout page" do
    visit "/fish/0"

    expect(page).to have_content("Trout")
    expect(page).to have_link("Wikipedia Link", options = {href: "http://en.wikipedia.org/wiki/Trout"})
    expect(page).to have_link("HOMEPAGE", options = {href: "/"})
    expect(page).to have_css("img[src='http://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Salmo_trutta.jpg/220px-Salmo_trutta.jpg']")
  end
  scenario "should have a betta page" do
    visit "/fish/2"

    expect(page).to have_content("Betta")
    expect(page).to have_link("HOMEPAGE", options = {href: "/"})
    expect(page).to have_link("Wikipedia Link", options = {href: "http://en.wikipedia.org/wiki/Betta"})
    expect(page).to have_css("img[src='http://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Betta_albimarginata_060311_8.jpg/250px-Betta_albimarginata_060311_8.jpg']")
  end


end
