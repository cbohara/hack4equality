var NewCompany = React.createClass({
  handleClick() {
    var name = this.refs.name.value;
    $.ajax({
      url: '/api/v1/companies',
      type: 'POST',
      data: { company: { name: name } },
      success: (company) => {
        this.props.handleSubmit(company);
      }
    });
  },

  render() {
    return (
      <div>
        <input ref='name' placeholder='Enter company name' />
        <button onClick={this.handleClick}>Submit</button>
      </div>
    )
  }
});
