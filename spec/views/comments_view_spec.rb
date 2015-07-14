describe 'comments/_comments' do
  let!(:rendered) { render :partial => "comments/comments" }
  let(:page) { Capybara::Node::Simple.new(rendered) }
  it { page.should have_selector('ul') }
end
