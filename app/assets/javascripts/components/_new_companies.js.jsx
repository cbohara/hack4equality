var NewCompany = React.createClass({
  handleClick() {
    var name = this.refs.name.value;
    $.ajax({
      url: '/api/v1/companies',
      type: 'POST',
      data: { company: { name: name } },
      success: (response) => {
        console.log('it worked!', response);
      }
    });
  },

  render() {
    return (
      <div>
        <h1>New Company</h1>
        <input ref='name' placeholder='Enter company name' />
        <button onClick={this.handleClick}>Submit</button>
      </div>
    )
  }
});
