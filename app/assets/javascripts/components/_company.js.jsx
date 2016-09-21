var Company = React.createClass({
  getInitialState() {
    return {editable: false}
  },

  handleEdit() {
    if(this.state.editable) {
      var name = this.refs.name.value;
      var id = this.props.company.id;
      var company = {id: id , name: name};
      this.props.handleUpdate(company);
    }
    this.setState({ editable: !this.state.editable })
  },

  render() {
    var name = this.state.editable ? <input type='text' ref='name' defaultValue={this.props.company.name} /> : <h3>{this.props.company.name}</h3>;
    return (
      <div>
        {name}
        <button onClick={this.props.handleDelete} >Delete</button>
        <button onClick={this.handleEdit}> {this.state.editable ? 'Submit' : 'Edit' } </button>
      </div>
    )
  }
});
