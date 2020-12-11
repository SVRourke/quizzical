class GroupValidator < ActiveModel::Validator
    def validate(record)
        if record.teacher.taught_classes.count {|g| g.name == record.name} > 0
            record.errors[:group] << "You already have a #{record.name} class"
        end
    end
end